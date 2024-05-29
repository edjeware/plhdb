--
-- Database "old_plhdb_demo" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: old_plhdb_demo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE old_plhdb_demo WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LOCALE = 'C';


ALTER DATABASE old_plhdb_demo OWNER TO postgres;

\connect old_plhdb_demo

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: audit; Type: SCHEMA; Schema: -; Owner: plhdb_admin
--

CREATE SCHEMA audit;


ALTER SCHEMA audit OWNER TO plhdb_admin;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: plhdb_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO plhdb_admin;

--
-- Name: bulkimp; Type: SCHEMA; Schema: -; Owner: plhdb_admin
--

CREATE SCHEMA bulkimp;


ALTER SCHEMA bulkimp OWNER TO plhdb_admin;

--
-- Name: plhdb; Type: SCHEMA; Schema: -; Owner: plhdb_admin
--

CREATE SCHEMA plhdb;


ALTER SCHEMA plhdb OWNER TO plhdb_admin;

--
-- Name: biography_ins_trf(); Type: FUNCTION; Schema: bulkimp; Owner: plhdb_admin
--

CREATE FUNCTION bulkimp.biography_ins_trf() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
        INSERT INTO biography (
                StudyID
                , AnimID
                , AnimName
                , Birthgroup
                , BGQual
                , Sex
                , MomID
                , FirstBorn
                , Birthdate
                , BDMin
                , BDMax
                , BDDist
                , Entrydate
                , Entrytype
                , Departdate
                , DepartdateError
                , Departtype)
        VALUES ( 
                new.StudyID
                , new.AnimID
                , new.AnimName
                , new.Birthgroup
                , new.BGQual
                , new.Sex
                , new.MomID
                , new.FirstBorn
                , new.Birthdate
                , new.BDMin
                , new.BDMax
                , new.BDDist
                , new.Entrydate
                , new.Entrytype
                , new.Departdate
                , new.DepartdateError
                , new.Departtype);
        RETURN NULL; -- no real insert into this table
END;
$$;


ALTER FUNCTION bulkimp.biography_ins_trf() OWNER TO plhdb_admin;

--
-- Name: femalefertilityinterval_ins_trf(); Type: FUNCTION; Schema: bulkimp; Owner: plhdb_admin
--

CREATE FUNCTION bulkimp.femalefertilityinterval_ins_trf() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
        INSERT INTO femalefertilityinterval (
                StudyID
                , AnimID
                , Startdate
                , Starttype
                , Stopdate
                , Stoptype)
        VALUES (
                new.StudyID
                , new.AnimID
                , new.Startdate
                , new.Starttype
                , new.Stopdate
                , new.Stoptype);
        RETURN NULL; -- no real insert into this table
END;
$$;


ALTER FUNCTION bulkimp.femalefertilityinterval_ins_trf() OWNER TO plhdb_admin;

--
-- Name: studyinfo_ins_trf(); Type: FUNCTION; Schema: bulkimp; Owner: plhdb_admin
--

CREATE FUNCTION bulkimp.studyinfo_ins_trf() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
        INSERT INTO studyinfo (
                StudyID
                , CommonName
                , SciName
                , SiteID
                , Owners
                , Latitude
                , Longitude)
        VALUES (
                new.StudyID
                , new.CommonName
                , new.SciName
                , new.SiteID
                , new.Owners
                , new.Latitude
                , new.Longitude);
        RETURN NULL; -- no real insert into this table
END;
$$;


ALTER FUNCTION bulkimp.studyinfo_ins_trf() OWNER TO plhdb_admin;

--
-- Name: get_cvterm_oid(character varying, character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_cvterm_oid(p_name character varying, p_code character varying, p_identifier character varying, p_namespace character varying, p_parent_name character varying, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_term_oid plhdb.cvterm.cvterm_oid%TYPE;
BEGIN
        -- obtain term primary key, first by identifier
        IF p_Identifier IS NOT NULL THEN
               SELECT INTO v_term_oid cvterm_oid 
               FROM plhdb.cvterm WHERE identifier = p_Identifier;
        END IF;
        -- if not found, try by name and namespace
        IF v_term_oid IS NULL AND p_Name IS NOT NULL THEN
               SELECT INTO v_term_oid cvterm_oid
               FROM plhdb.cvterm 
               WHERE name = p_Name AND namespace = p_Namespace;
        END IF;
        -- if still not found, try by code, parent term, and namespace
        IF v_term_oid IS NULL AND p_Code IS NOT NULL THEN
               SELECT INTO v_term_oid t.cvterm_oid 
               FROM plhdb.cvterm t 
                    JOIN plhdb.cvterm_relationship rel ON (rel.subject_oid = t.cvterm_oid)
                    JOIN plhdb.cvterm p ON (rel.object_oid = p.cvterm_oid)
               WHERE t.code = p_Code AND t.namespace = p_Namespace
               AND   p.name = p_Parent_Name AND p.namespace = p_Namespace;
        END IF;
        -- if DML is not allowed we've done all we can
        IF p_do_DML = 0 THEN
               RETURN v_term_oid;
        END IF;
        -- otherwise create if not found, and update otherwise
        IF v_term_oid IS NULL AND p_do_DML & 1 = 1 THEN
               INSERT INTO plhdb.cvterm (name, code, identifier, namespace)
               VALUES (p_Name, p_Code, p_Identifier, p_Namespace);
               SELECT INTO v_term_oid CURRVAL('plhdb.cvterm_cvterm_oid_seq');
        ELSIF p_do_DML & 2 = 2 THEN
               UPDATE plhdb.cvterm SET
                      name = COALESCE(p_Name, name)
                      , code = COALESCE(p_Code, code)
                      , identifier = COALESCE(p_Identifier, identifier)
                      , namespace = COALESCE(p_Namespace, namespace)
               WHERE cvterm_oid = v_term_oid;
        END IF;
        RETURN v_term_oid;
END;
$$;


ALTER FUNCTION plhdb.get_cvterm_oid(p_name character varying, p_code character varying, p_identifier character varying, p_namespace character varying, p_parent_name character varying, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_cvterm_oid(integer, character varying, character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_cvterm_oid(p_oid integer, p_name character varying, p_code character varying, p_identifier character varying, p_namespace character varying, p_parent_name character varying, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_term_oid plhdb.cvterm.cvterm_oid%TYPE;
BEGIN
        IF p_Oid IS NOT NULL THEN
               RETURN p_Oid;
        END IF;
        v_term_oid := plhdb.get_cvterm_oid(p_Name
                                           , p_Code
                                           , p_Identifier
                                           , p_Namespace
                                           , p_Parent_Name
                                           , p_do_DML);
        RETURN v_term_oid;
END;
$$;


ALTER FUNCTION plhdb.get_cvterm_oid(p_oid integer, p_name character varying, p_code character varying, p_identifier character varying, p_namespace character varying, p_parent_name character varying, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_cvterm_relationship_oid(integer, character varying, character varying, character varying, character varying, integer, character varying, character varying, character varying, character varying, integer, character varying, character varying, character varying, character varying, integer, integer, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_cvterm_relationship_oid(p_subj_oid integer, p_subj_name character varying, p_subj_code character varying, p_subj_identifier character varying, p_subj_namespace character varying, p_pred_oid integer, p_pred_name character varying, p_pred_code character varying, p_pred_identifier character varying, p_pred_namespace character varying, p_obj_oid integer, p_obj_name character varying, p_obj_code character varying, p_obj_identifier character varying, p_obj_namespace character varying, p_old_subj_oid integer, p_old_obj_oid integer, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_rel_oid plhdb.cvterm_relationship.cvterm_relationship_oid%TYPE;
        v_subj_oid plhdb.cvterm.cvterm_oid%TYPE;
        v_pred_oid plhdb.cvterm.cvterm_oid%TYPE;
        v_obj_oid plhdb.cvterm.cvterm_oid%TYPE;
BEGIN
        -- obtain primary key of subject term (create if necessary)
        IF p_Subj_Oid IS NULL THEN
               v_subj_oid := plhdb.get_cvterm_oid(p_Subj_Name
                                                  , p_Subj_Code
                                                  , p_Subj_Identifier
                                                  , p_Subj_Namespace
                                                  , NULL
                                                  , p_do_DML);
        ELSE
               v_subj_oid := p_Subj_Oid;
        END IF;
        -- obtain primary key of predicate term (create if necessary)
        IF p_Pred_Oid IS NULL THEN
               v_pred_oid := plhdb.get_cvterm_oid(p_Pred_Name
                                                  , p_Pred_Code
                                                  , p_Pred_Identifier
                                                  , p_Pred_Namespace
                                                  , NULL
                                                  , p_do_DML);
        ELSE
               v_pred_oid := p_Pred_Oid;
        END IF;
        -- obtain primary key of object term (create if necessary)
        IF p_Obj_Oid IS NULL THEN
               v_obj_oid := plhdb.get_cvterm_oid(p_Obj_Name
                                                 , p_Obj_Code
                                                 , p_Obj_Identifier
                                                 , p_Obj_Namespace
                                                 , NULL
                                                 , p_do_DML);
        ELSE
               v_obj_oid := p_Obj_Oid;
        END IF;
        -- obtain primary key of relationship (if it exists already)
        SELECT INTO v_rel_oid cvterm_relationship_oid
        FROM plhdb.cvterm_relationship
        WHERE subject_oid = COALESCE(p_Old_Subj_Oid, v_subj_oid)
        AND object_oid = COALESCE(p_Old_Obj_Oid, v_obj_oid);
        -- if no DML allowed, we've done all we can
        IF p_do_DML = 0 THEN
               RETURN v_rel_oid;
        END IF;
        -- insert if not found, and update otherwise
        IF v_rel_oid IS NULL AND p_do_DML & 1 = 1 THEN
               INSERT INTO plhdb.cvterm_relationship (subject_oid, 
                                                      predicate_oid, 
                                                      object_oid)
               VALUES (v_subj_oid, v_pred_oid, v_obj_oid);
               SELECT INTO v_rel_oid CURRVAL('plhdb.cvterm_relationship_cvterm_relationship_oid_seq');
        ELSIF p_do_DML & 2 = 2 THEN
               UPDATE plhdb.cvterm_relationship SET
                      subject_oid = v_subj_oid
                      , predicate_oid = v_pred_oid
                      , object_oid = v_obj_oid
               WHERE cvterm_relationship_oid = v_rel_oid;
        END IF;
        RETURN v_rel_oid;
END;
$$;


ALTER FUNCTION plhdb.get_cvterm_relationship_oid(p_subj_oid integer, p_subj_name character varying, p_subj_code character varying, p_subj_identifier character varying, p_subj_namespace character varying, p_pred_oid integer, p_pred_name character varying, p_pred_code character varying, p_pred_identifier character varying, p_pred_namespace character varying, p_obj_oid integer, p_obj_name character varying, p_obj_code character varying, p_obj_identifier character varying, p_obj_namespace character varying, p_old_subj_oid integer, p_old_obj_oid integer, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_individual_oid(character varying, integer, character varying, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_individual_oid(p_id character varying, p_study_oid integer, p_study_id character varying, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_ind_oid plhdb.individual.individual_oid%TYPE;
        indrec RECORD;
        v_studies TEXT;
        v_numstudies INTEGER;
BEGIN
        -- as a shortcut to save time, and to prevent existing records
        -- from having most of their attributes updates to null, run
        -- query directly
        IF p_Study_Oid IS NULL THEN
               IF p_Study_ID IS NULL THEN
                      v_numstudies := 0;
                      v_studies := '';
                      FOR indrec IN SELECT i.individual_oid, s.id AS sid
                                    FROM plhdb.individual i 
                                      JOIN plhdb.study s 
                                      ON (i.study_oid = s.study_oid)
                                    WHERE i.id = p_Id
                      LOOP
                             v_ind_oid := indrec.individual_oid;
                             v_numstudies := v_numstudies+1;
                             IF v_numstudies > 1 THEN
                                     v_studies := v_studies || ', ';
                             END IF;
                             v_studies := v_studies || indrec.sid; 
                      END LOOP;
                      IF v_numstudies > 1 THEN
                             RAISE EXCEPTION 'ID % is ambiguous for individual, is in % different studies (%)', p_Id, v_numstudies, v_studies;
                      END IF;
               ELSE
                      SELECT INTO v_ind_oid i.individual_oid
                      FROM plhdb.individual i 
                        JOIN plhdb.study s ON (i.study_oid = s.study_oid)
                      WHERE i.id = p_Id AND s.id = p_Study_ID;
               END IF;
        ELSE
               SELECT INTO v_ind_oid i.individual_oid
               FROM plhdb.individual i 
               WHERE i.id = p_Id AND i.study_oid = p_Study_Oid;
        END IF;
        -- update/insert only if not found, and if DML allowed
        IF p_do_DML > 0 AND v_ind_oid IS NULL THEN
               v_ind_oid := plhdb.get_individual_oid(NULL,
                                                     p_Id,
                                                     NULL,NULL,NULL,NULL,
                                                     p_Study_Oid,
                                                     p_Study_ID,
                                                     NULL,
                                                     p_do_DML);
        END IF;
        RETURN v_ind_oid;
END;
$$;


ALTER FUNCTION plhdb.get_individual_oid(p_id character varying, p_study_oid integer, p_study_id character varying, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_individual_oid(character varying, character varying, character, character varying, character, character, integer, character varying, integer, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_individual_oid(p_name character varying, p_id character varying, p_sex character, p_birthgroup character varying, p_birthgroup_certainty character, p_is_first_born character, p_study_oid integer, p_study_id character varying, p_old_oid integer, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_ind_oid plhdb.individual.individual_oid%TYPE;
        v_study_oid plhdb.study.study_oid%TYPE;
BEGIN
        -- obtain the primary key of the study
        IF p_Study_Oid IS NULL THEN
               SELECT INTO v_study_oid study_oid 
               FROM plhdb.study WHERE id = p_Study_ID;
        ELSE
               v_study_oid := p_Study_Oid;
        END IF;
        -- obtain the primary key of the individual
        IF p_Old_Oid IS NULL THEN
               -- look up: first by id
               SELECT INTO v_ind_oid individual_oid 
               FROM plhdb.individual 
               WHERE id = p_Id AND study_oid = v_study_oid;
               -- if unsuccessful try by name
               IF NOT FOUND THEN
                      SELECT INTO v_ind_oid individual_oid 
                      FROM plhdb.individual 
                      WHERE name = p_Name AND study_oid = v_study_oid;
               END IF;
        ELSE 
               -- we will be updating the old record
               v_ind_oid := p_Old_Oid;
        END IF;
        -- if no DML allowed, we've done all we can
        IF p_do_DML = 0 THEN
               RETURN v_ind_oid;
        END IF;
        -- if not found, insert as new, otherwise update
        IF v_ind_oid IS NULL AND p_do_DML & 1 = 1 THEN
               INSERT INTO plhdb.individual (
                                       name, id, sex
                                       , birthgroup, birthgroup_certainty
                                       , is_first_born, study_oid)
               VALUES (p_Name, p_Id, p_Sex, p_Birthgroup, p_Birthgroup_certainty
                       , p_Is_first_born, v_study_oid);
               SELECT INTO v_ind_oid 
                      CURRVAL('plhdb.individual_individual_oid_seq');
        ELSIF p_do_DML & 2 = 2 THEN
               UPDATE plhdb.individual SET
                      name = p_Name
                      , id = p_Id
                      , sex = p_Sex
                      , birthgroup = p_Birthgroup
                      , birthgroup_certainty = p_Birthgroup_certainty
                      , is_first_born = p_Is_First_Born
                      , study_oid = v_study_oid
               WHERE individual_oid = v_ind_oid;               
        END IF;
        RETURN v_ind_oid;
END;
$$;


ALTER FUNCTION plhdb.get_individual_oid(p_name character varying, p_id character varying, p_sex character, p_birthgroup character varying, p_birthgroup_certainty character, p_is_first_born character, p_study_oid integer, p_study_id character varying, p_old_oid integer, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_observation_oid(timestamp without time zone, double precision, integer, integer, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_observation_oid(p_time_of_observation timestamp without time zone, p_time_error double precision, p_cvterm_oid integer, p_individual_oid integer, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_obs_oid plhdb.observation.observation_oid%TYPE;
BEGIN
        v_obs_oid := plhdb.get_observation_oid(
                                         p_Time_of_observation
                                         , p_Time_error
                                         , NULL
                                         , NULL
                                         , NULL
                                         , p_CvTerm_oid
                                         , p_Individual_oid
                                         , NULL
                                         , p_do_DML);
        RETURN v_obs_oid;
END;
$$;


ALTER FUNCTION plhdb.get_observation_oid(p_time_of_observation timestamp without time zone, p_time_error double precision, p_cvterm_oid integer, p_individual_oid integer, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_observation_oid(timestamp without time zone, double precision, integer, integer, integer, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_observation_oid(p_time_of_observation timestamp without time zone, p_time_error double precision, p_cvterm_oid integer, p_individual_oid integer, p_old_observation integer, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_obs_oid plhdb.observation.observation_oid%TYPE;
BEGIN
        v_obs_oid := plhdb.get_observation_oid(
                                         p_Time_of_observation
                                         , p_Time_error
                                         , NULL
                                         , NULL
                                         , NULL
                                         , p_CvTerm_oid
                                         , p_Individual_oid
                                         , p_Old_Observation
                                         , p_do_DML);
        RETURN v_obs_oid;
END;
$$;


ALTER FUNCTION plhdb.get_observation_oid(p_time_of_observation timestamp without time zone, p_time_error double precision, p_cvterm_oid integer, p_individual_oid integer, p_old_observation integer, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_observation_oid(timestamp without time zone, double precision, timestamp without time zone, timestamp without time zone, integer, integer, integer, integer, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_observation_oid(p_time_of_observation timestamp without time zone, p_time_error double precision, p_min_boundary timestamp without time zone, p_max_boundary timestamp without time zone, p_prob_type_oid integer, p_cvterm_oid integer, p_individual_oid integer, p_old_observation integer, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_obs_oid plhdb.observation.observation_oid%TYPE;
        v_newobs_oid plhdb.observation.observation_oid%TYPE;
BEGIN
        -- try to find observation record if it exists already
        SELECT INTO v_obs_oid observation_oid FROM plhdb.observation 
        WHERE time_of_observation = p_Time_of_observation
        AND type_oid = p_CvTerm_oid
        AND individual_oid = p_Individual_oid;
        -- If we are updating from an old record, the record with the
        -- new unique key values may exist already, and therefore
        -- would clash if we updated the existing one. Hence, do so
        -- only if the new unique values haven't been found.
        IF p_Old_Observation IS NOT NULL AND v_obs_oid IS NULL THEN
               v_obs_oid := p_Old_Observation;
        END IF;
        -- if DML is not allowed, we've done all we can
        IF p_do_DML = 0 THEN
               RETURN v_obs_oid;
        END IF;
        -- insert if not found and update otherwise
        IF v_obs_oid IS NULL AND p_do_DML & 1 = 1 THEN
               INSERT INTO plhdb.observation (time_of_observation
                                              , time_error
                                              , min_boundary
                                              , max_boundary
                                              , prob_type_oid
                                              , type_oid
                                              , individual_oid)
               VALUES (p_Time_of_observation, 
                       p_Time_error, p_Min_boundary, p_Max_boundary,
                       p_Prob_type_oid, p_CvTerm_oid, p_Individual_Oid);
               SELECT INTO v_obs_oid 
                      CURRVAL('plhdb.observation_observation_oid_seq');
        ELSIF p_do_DML & 2 = 2 THEN
               UPDATE plhdb.observation SET
                      time_of_observation = p_Time_of_observation
                      , time_error = CASE WHEN p_Time_error < 0 
                                     THEN time_error
                                     ELSE p_Time_error
                                     END
                      , min_boundary = p_Min_boundary
                      , max_boundary = p_Max_boundary
                      , prob_type_oid = p_Prob_type_oid
                      , type_oid = p_CvTerm_oid
                      , individual_oid = p_Individual_oid
               WHERE observation_oid = v_obs_oid;
        END IF; 
        RETURN v_obs_oid;
END;
$$;


ALTER FUNCTION plhdb.get_observation_oid(p_time_of_observation timestamp without time zone, p_time_error double precision, p_min_boundary timestamp without time zone, p_max_boundary timestamp without time zone, p_prob_type_oid integer, p_cvterm_oid integer, p_individual_oid integer, p_old_observation integer, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_parent_rel_oid(integer, integer, integer, character varying, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_parent_rel_oid(p_child_oid integer, p_parent_oid integer, p_old_parent_oid integer, p_reltype character varying, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_rel_oid plhdb.individual_relationship.individual_relationship_oid%TYPE;
BEGIN
        -- obtain the relationship record to update for the child, and either
        -- old parent or new parent
        SELECT INTO v_rel_oid individual_relationship_oid
        FROM plhdb.individual_relationship
        WHERE child_oid = p_Child_oid 
        AND parent_oid = COALESCE(p_Old_Parent_oid, p_Parent_oid);
        -- if DML is not allowed, this is all we can do
        IF p_do_DML = 0 THEN
               RETURN v_rel_oid;
        END IF;
        -- if we are updating the parent to null, it means to delete the record
        IF p_Old_Parent_oid IS NOT NULL AND p_Parent_oid IS NULL THEN
               DELETE FROM plhdb.individual_relationship 
               WHERE individual_relationship_oid = v_rel_oid;
        END IF;
        -- otherwise, either insert (if relationship wasn't found) or update
        --
        -- but be careful not to create a relationship to indicate the
        -- absence of one (and no relationship is different from
        -- failing to find the parent, which we do want to cause a
        -- failure in the following insert or update)
        IF v_rel_oid IS NULL AND p_Parent_Oid IS NOT NULL THEN
               INSERT INTO plhdb.individual_relationship (child_oid, 
                                                          parent_oid,
                                                          reltype)
               VALUES (p_Child_oid, p_Parent_oid, p_Reltype);
               SELECT INTO v_rel_oid CURRVAL('plhdb.individual_relationship_individual_relationship_oid_seq');
        ELSIF p_Parent_Oid IS NOT NULL THEN
               UPDATE plhdb.individual_relationship SET
                      parent_oid = p_Parent_oid
                      , reltype = p_Reltype
               WHERE individual_relationship_oid = v_rel_oid;
        END IF;
        RETURN v_rel_oid;
END;
$$;


ALTER FUNCTION plhdb.get_parent_rel_oid(p_child_oid integer, p_parent_oid integer, p_old_parent_oid integer, p_reltype character varying, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_recordingperiod_oid(integer, integer, integer, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_recordingperiod_oid(p_start_oid integer, p_end_oid integer, p_type_oid integer, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_recper_oid plhdb.recordingperiod.recordingperiod_oid%TYPE;
BEGIN
        v_recper_oid := plhdb.get_recordingperiod_oid(
                                            p_Start_Oid, p_End_Oid, p_Type_Oid
                                            , NULL, NULL, NULL
                                            , p_do_DML);
        RETURN v_recper_oid;
END;
$$;


ALTER FUNCTION plhdb.get_recordingperiod_oid(p_start_oid integer, p_end_oid integer, p_type_oid integer, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_recordingperiod_oid(integer, integer, integer, integer, integer, integer, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_recordingperiod_oid(p_start_oid integer, p_end_oid integer, p_type_oid integer, p_old_start_oid integer, p_old_end_oid integer, p_old_type_oid integer, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_recper_oid plhdb.recordingperiod.recordingperiod_oid%TYPE;
        v_newrec_oid plhdb.recordingperiod.recordingperiod_oid%TYPE;
BEGIN
        -- obtain the primary key of the record, possibly locating it
        -- by old values
        SELECT INTO v_recper_oid recordingperiod_oid
        FROM plhdb.recordingperiod
        WHERE start_oid = p_Start_Oid
        AND   COALESCE(end_oid, -1) = COALESCE(p_End_Oid, -1)
        AND   type_oid = p_Type_Oid;
        -- locating new and old records needs to be done separately
        -- because one of the unique key columns (end_oid) is nullable
        IF p_Old_Start_Oid IS NOT NULL THEN
               v_newrec_oid := v_recper_oid;
               SELECT INTO v_recper_oid recordingperiod_oid
               FROM plhdb.recordingperiod
               WHERE start_oid = p_Old_Start_Oid
               AND   COALESCE(end_oid, -1) = COALESCE(p_Old_End_Oid, -1)
               AND   type_oid = p_Old_Type_Oid;
               -- If the old record is found and a record with the new
               -- values exists already (and is different one than the
               -- old), we can't update the old one to the new values,
               -- nor insert the new values as a new record as
               -- otherwise we'd get a unique key failure. We'll
               -- interpret this as a request to delete the old record
               -- (provided it is different from the new one), so as
               -- to switch it to the new. This may have undesirable
               -- effects, and may need to be changed.
               IF FOUND AND v_newrec_oid != v_recper_oid THEN
                      DELETE FROM plhdb.recordingperiod 
                      WHERE recordingperiod_oid = v_recper_oid;
                      v_recper_oid := v_newrec_oid;
               ELSIF v_newrec_oid IS NOT NULL THEN
                      -- getting here means that either the old record
                      -- hasn't been found but the new one has, or
                      -- that both old and new are identical
                      v_recper_oid := v_newrec_oid;
               END IF;
        END IF;
        -- If DML is not allowed, we've done all we can. Also, if the
        -- new record exists already, there's nothing to be updated
        -- because all columns are in the unique key constraint.
        IF (p_do_DML = 0)
           -- are we updating but the new values already form a record?
           OR (v_recper_oid = v_newrec_oid)
           -- are we inserting but the record exists already?
           OR (v_recper_oid IS NOT NULL AND p_Old_Start_Oid IS NULL) THEN
               RETURN v_recper_oid;
        END IF;
        -- insert if not found, and update to new values otherwise
        IF v_recper_oid IS NULL AND p_do_DML & 1 = 1 THEN
               INSERT INTO plhdb.recordingperiod (start_oid, end_oid, type_oid)
               VALUES (p_Start_Oid, p_End_Oid, p_Type_Oid);
               SELECT INTO v_recper_oid CURRVAL('plhdb.recordingperiod_recordingperiod_oid_seq');
        ELSIF p_do_DML & 2 = 2 THEN
               UPDATE plhdb.recordingperiod SET
                      start_oid = p_Start_Oid
                      , end_oid = p_End_Oid
                      , type_oid = p_Type_Oid
               WHERE recordingperiod_oid = v_recper_oid;
        END IF;
        RETURN v_recper_oid;
END;
$$;


ALTER FUNCTION plhdb.get_recordingperiod_oid(p_start_oid integer, p_end_oid integer, p_type_oid integer, p_old_start_oid integer, p_old_end_oid integer, p_old_type_oid integer, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: get_site_oid(character varying, numeric, numeric, character varying, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_site_oid(p_name character varying, p_latitude numeric, p_longitude numeric, p_geodetic_datum character varying, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_site_oid plhdb.site.site_oid%TYPE;
BEGIN
        -- obtain or, if new, insert site
        SELECT INTO v_site_oid site_oid 
               FROM plhdb.site WHERE name = p_Name;
        -- if no DML allowed, we've done all we can
        IF p_do_DML = 0 THEN
               RETURN v_site_oid;
        END IF;
        -- if not found, insert as new, otherwise update
        IF v_site_oid IS NULL AND p_do_DML & 1 = 1 THEN
               IF p_Geodetic_Datum IS NULL THEN
                       -- allow default value of geodetic_datum to take effect
                       INSERT INTO plhdb.site (name, latitude, longitude)
                       VALUES (p_Name, p_Latitude, p_Longitude);
               ELSE
                       INSERT INTO plhdb.site (name,latitude,longitude,geodetic_datum)
                       VALUES (p_Name,p_Latitude,p_Longitude,p_Geodetic_Datum);
               END IF;
               SELECT INTO v_site_oid CURRVAL('plhdb.site_site_oid_seq');
        ELSIF p_do_DML & 2 = 2 THEN
               UPDATE plhdb.site SET
                       name = p_Name
                       , latitude = p_Latitude
                       , longitude = p_Longitude
                       , geodetic_datum = COALESCE(p_Geodetic_Datum, 
                                                   geodetic_datum)
               WHERE site_oid = v_site_oid;
        END IF;
        RETURN v_site_oid;
END;
$$;


ALTER FUNCTION plhdb.get_site_oid(p_name character varying, p_latitude numeric, p_longitude numeric, p_geodetic_datum character varying, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: FUNCTION get_site_oid(p_name character varying, p_latitude numeric, p_longitude numeric, p_geodetic_datum character varying, p_do_dml integer); Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON FUNCTION plhdb.get_site_oid(p_name character varying, p_latitude numeric, p_longitude numeric, p_geodetic_datum character varying, p_do_dml integer) IS 'Retrieves the primary key of the site identified by the given name, creating the record if not found and updating it otherwise, provided the DML parameter is true. Params: name, latitude, longitude, geodetic datum, 0 to disallow DML and bit-wise OR of 1 and 2 to allow insert and update, respectively. If geodetic datum is NULL, the default (or existing) value will take effect.';


--
-- Name: get_study_oid(character varying); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_study_oid(p_id character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_study_oid plhdb.study.study_oid%TYPE;
BEGIN
        SELECT INTO v_study_oid study_oid FROM plhdb.study WHERE id = p_Id;
        RETURN v_study_oid;
END;
$$;


ALTER FUNCTION plhdb.get_study_oid(p_id character varying) OWNER TO plhdb_admin;

--
-- Name: get_taxon_oid(character varying, character varying, integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.get_taxon_oid(p_common_name character varying, p_scientific_name character varying, p_do_dml integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
        v_taxon_oid plhdb.taxon.taxon_oid%TYPE;
BEGIN
        -- obtain taxon by scientific name
        SELECT INTO v_taxon_oid taxon_oid 
               FROM plhdb.taxon WHERE scientific_name = p_Scientific_Name;
        -- if unsuccessful try by common name
        IF NOT FOUND THEN
               SELECT INTO v_taxon_oid taxon_oid 
                      FROM plhdb.taxon WHERE common_name = p_common_Name;
        END IF;
        -- if no DML allowed, we've done all we can
        IF p_do_DML = 0 THEN
               RETURN v_taxon_oid;
        END IF;
        -- if not found, insert as new, otherwise update
        IF v_taxon_oid IS NULL AND p_do_DML & 1 = 1 THEN
               INSERT INTO plhdb.taxon (scientific_name, common_name)
               VALUES (p_Scientific_Name, p_Common_Name);
               SELECT INTO v_taxon_oid CURRVAL('plhdb.taxon_taxon_oid_seq');
        ELSIF p_do_DML & 2 = 2 THEN
               UPDATE plhdb.taxon SET
                      common_name = p_Common_Name
                      , scientific_name = p_Scientific_Name
               WHERE taxon_oid = v_taxon_oid;
        END IF;
        RETURN v_taxon_oid;
END;
$$;


ALTER FUNCTION plhdb.get_taxon_oid(p_common_name character varying, p_scientific_name character varying, p_do_dml integer) OWNER TO plhdb_admin;

--
-- Name: FUNCTION get_taxon_oid(p_common_name character varying, p_scientific_name character varying, p_do_dml integer); Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON FUNCTION plhdb.get_taxon_oid(p_common_name character varying, p_scientific_name character varying, p_do_dml integer) IS 'Retrieves the primary key of the taxon qualified by the given parameters, creating the record if not found, and updating it otherwise, provided the DML parameter is non-zero. Params: common name, scientific name, 0 to disallow DML and bit-wise OR of 1 and 2 to allow insert and update, respectively.';


--
-- Name: ins_biography_assocs(character varying, character varying, character varying, character varying, character, character, character varying, character, timestamp without time zone, timestamp without time zone, timestamp without time zone, character varying, timestamp without time zone, character varying, timestamp without time zone, double precision, character varying); Type: FUNCTION; Schema: public; Owner: plhdb_admin
--

CREATE FUNCTION public.ins_biography_assocs(p_studyid character varying, p_animid character varying, p_animname character varying, p_birthgroup character varying, p_bgqual character, p_sex character, p_momid character varying, p_firstborn character, p_birthdate timestamp without time zone, p_bdmin timestamp without time zone, p_bdmax timestamp without time zone, p_bddist character varying, p_entrydate timestamp without time zone, p_entrytype character varying, p_departdate timestamp without time zone, p_departdateerror double precision, p_departtype character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
       v_study_oid plhdb.study.study_oid%TYPE;
       v_ind_oid plhdb.individual.individual_oid%TYPE;
BEGIN
       -- the current model is that each individual has only one entry
       -- in biography, so we will insert that record first
       --
       -- look up study first for later reuse
       SELECT INTO v_study_oid study_oid
       FROM plhdb.study WHERE id = p_StudyID;
       -- the individual (here: animal)
       v_ind_oid := plhdb.get_individual_oid(
                                   p_AnimName, p_AnimId, p_Sex, 
                                   p_Birthgroup, p_BGQual, p_FirstBorn,
                                   v_study_oid, NULL, 
                                   NULL, -- no old study here
                                   3 -- allow insert and update
       );
       -- create (or update) the relationship to the parent (here: mother)
       IF p_MomID IS NOT NULL THEN
              PERFORM plhdb.get_parent_rel_oid(
                                 v_ind_oid, 
                                 plhdb.get_individual_oid(p_MomID, v_study_oid, 
                                                          NULL, 1),
                                 NULL, -- no old parent here
                                 'maternal parent',
                                 3 -- allow insert and update
              );
       END IF;
       -- create (or update) the birth observation
       PERFORM plhdb.get_observation_oid(
                                 p_Birthdate, NULL,
                                 p_BDMin, p_BDMax,
                                 plhdb.get_cvterm_oid(NULL, p_BDDist, NULL,
                                                    'probability types',
                                                    'probability distribution', 
                                                    0),
                                 plhdb.get_cvterm_oid('date of birth', 
                                                      NULL, NULL,
                                                      'event types', NULL, 
                                                      0),
                                 v_ind_oid,
                                 NULL,
                                 3 -- allow insert and update
       );
       -- create the recording period (note that according to our
       -- datamodel, a new record with no entry date will actually not
       -- show up)
       IF p_Entrydate IS NOT NULL THEN
              PERFORM plhdb.get_recordingperiod_oid(
                        plhdb.get_observation_oid(
                                  p_Entrydate, NULL,
                                  plhdb.get_cvterm_oid(NULL,p_Entrytype,NULL,
                                                       'event types',
                                                       'start of recording',
                                                       0),
                                  v_ind_oid,
                                  3 -- allow insert and update
                        ),
                        CASE WHEN p_Departdate IS NULL THEN NULL ELSE
                        plhdb.get_observation_oid(
                                  p_Departdate, p_DepartdateError,
                                  plhdb.get_cvterm_oid(NULL,p_Departtype,NULL,
                                                       'event types',
                                                       'end of recording',
                                                       0),
                                  v_ind_oid,
                                  3 -- allow insert and update
                        )
                        END,
                        plhdb.get_cvterm_oid('total observation period',
                                             NULL, NULL,
                                             'period types', NULL,
                                             0),
                        1 -- allow insert 
              );
      END IF;
      RETURN v_ind_oid;
END;
$$;


ALTER FUNCTION public.ins_biography_assocs(p_studyid character varying, p_animid character varying, p_animname character varying, p_birthgroup character varying, p_bgqual character, p_sex character, p_momid character varying, p_firstborn character, p_birthdate timestamp without time zone, p_bdmin timestamp without time zone, p_bdmax timestamp without time zone, p_bddist character varying, p_entrydate timestamp without time zone, p_entrytype character varying, p_departdate timestamp without time zone, p_departdateerror double precision, p_departtype character varying) OWNER TO plhdb_admin;

--
-- Name: pg_owner(text, text, text, text); Type: FUNCTION; Schema: public; Owner: plhdb_admin
--

CREATE FUNCTION public.pg_owner(curr_owner text, new_owner text, ptrn text, nsp text) RETURNS integer
    LANGUAGE plpgsql
    AS $$ DECLARE
   obj record;
   num integer;
 BEGIN
   num:=0;
   FOR obj IN SELECT relname FROM pg_class c
     JOIN pg_namespace ns ON (c.relnamespace = ns.oid)
     JOIN pg_roles u ON (u.oid = c.relowner)
     WHERE relkind IN ('r','v','S') 
     AND nspname = nsp AND relname LIKE ptrn
     AND u.rolname = COALESCE(curr_owner, u.rolname)
     ORDER BY relkind DESC
   LOOP
     EXECUTE 'ALTER TABLE ' || nsp || '.' || obj.relname || ' OWNER TO ' || new_owner;
     num := num + 1;
   END LOOP;
   RETURN num;
 END;
 $$;


ALTER FUNCTION public.pg_owner(curr_owner text, new_owner text, ptrn text, nsp text) OWNER TO plhdb_admin;

--
-- Name: FUNCTION pg_owner(curr_owner text, new_owner text, ptrn text, nsp text); Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON FUNCTION public.pg_owner(curr_owner text, new_owner text, ptrn text, nsp text) IS 'Changes the owner on database or schema objects in bulk. Parameters are the current database owner (or role), the new database owner (or role), 
 the text pattern (for LIKE queries) to match schema  objects by, and the name of the schema (public for the default public schema). 
 Returns the number of schema objects for which the owner was changed.';


--
-- Name: upd_biography_assocs(character varying, character varying, character varying, character varying, character, character, character varying, character, timestamp without time zone, timestamp without time zone, timestamp without time zone, character varying, timestamp without time zone, character varying, timestamp without time zone, double precision, character varying, character varying, character varying, character varying, timestamp without time zone, timestamp without time zone, character varying, timestamp without time zone, character varying); Type: FUNCTION; Schema: public; Owner: plhdb_admin
--

CREATE FUNCTION public.upd_biography_assocs(p_studyid character varying, p_animid character varying, p_animname character varying, p_birthgroup character varying, p_bgqual character, p_sex character, p_momid character varying, p_firstborn character, p_birthdate timestamp without time zone, p_bdmin timestamp without time zone, p_bdmax timestamp without time zone, p_bddist character varying, p_entrydate timestamp without time zone, p_entrytype character varying, p_departdate timestamp without time zone, p_departdateerror double precision, p_departtype character varying, p_old_studyid character varying, p_old_animid character varying, p_old_momid character varying, p_old_birthdate timestamp without time zone, p_old_entrydate timestamp without time zone, p_old_entrytype character varying, p_old_departdate timestamp without time zone, p_old_departtype character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
      v_study_oid plhdb.study.study_oid%TYPE;
      v_ind_oid plhdb.individual.individual_oid%TYPE;
      v_old_study_oid plhdb.study.study_oid%TYPE;
      v_bterm_oid plhdb.cvterm.cvterm_oid%TYPE;
      v_obirth_oid plhdb.observation.observation_oid%TYPE;
      v_ret boolean;
BEGIN
       -- the current model is that each individual has only one entry
       -- in biography, so we will update that record
       --
       -- look up study (old and new) first for later reuse
       SELECT INTO v_study_oid study_oid
       FROM plhdb.study WHERE id = p_StudyID;
       -- if studyID is unchanged then the oid is unchanged too, so
       -- save a lookup
       IF p_studyID = p_Old_StudyID THEN
               v_old_study_oid := v_study_oid;
       ELSE
               SELECT INTO v_old_study_oid study_oid
               FROM plhdb.study WHERE id = p_Old_StudyID;
       END IF;
       -- Obtain the primary key of the individual using the old
       -- values. Even if study or ID changed, we will be updating the
       -- individual. This has the (desirable) side effect that
       -- changing ID or study to values that will cause a unique key
       -- conflict will result in an error.
       SELECT INTO v_ind_oid individual_oid
       FROM plhdb.individual 
       WHERE id = p_Old_AnimID AND study_oid = v_old_study_oid;
       -- update the individual (here: animal)
       UPDATE plhdb.individual SET
              name = p_AnimName
              , id = p_AnimId
              , sex = p_Sex
              , birthgroup = p_Birthgroup
              , birthgroup_certainty = p_BGQual
              , is_first_born = p_FirstBorn
              , study_oid = v_study_oid
       WHERE individual_oid = v_ind_oid;
       -- create (or update) the relationship to the parent (here: mother)
       IF p_Old_MomID IS NOT NULL AND p_MomID IS NULL THEN
              DELETE FROM plhdb.individual_relationship
              WHERE child_oid = v_ind_oid
              AND parent_oid = (
                     SELECT individual_oid FROM plhdb.individual
                     WHERE id = p_Old_MomID AND study_oid = v_old_study_oid
              );
       ELSIF p_MomID IS NOT NULL 
             AND (p_Old_MomID IS NULL OR p_Old_MomID != p_MomID) THEN
              PERFORM plhdb.get_parent_rel_oid(
                                 v_ind_oid,
                                 plhdb.get_individual_oid(p_MomID, v_study_oid, 
                                                          NULL, 1),
                                 CASE WHEN p_Old_MomID IS NULL THEN NULL ELSE
                                      plhdb.get_individual_oid(p_Old_MomId,
                                                               v_old_study_oid, 
                                                               NULL,
                                                               0)
                                 END,
                                 'maternal parent',
                                 3 -- allow insert and update
              );
       ELSIF p_Old_MomID IS NOT NULL AND v_study_oid != v_old_study_oid THEN
              -- if we are not removing or updating the mother, but
              -- change the study for the individual, we will also
              -- need to change the study for the mother (because in
              -- the current biography model the study for the mother
              -- individual is tied to be the same as for the child)
              UPDATE plhdb.individual SET
                     study_oid = v_study_oid
              WHERE id = p_Old_MomID AND study_oid = v_old_study_oid;
       END IF;
       -- Create or update the birth observation. We could check
       -- whether dates and date errors are identical and save the
       -- update then (but would then need to pass old error as a
       -- parameter).
       --
       -- obtain primary key of birth event type term (must exist)
       v_bterm_oid := plhdb.get_cvterm_oid('date of birth', NULL, NULL,
                                           'event types', NULL, 0);
       -- if there was a birth date, obtain the primary key of
       -- the observation
       IF p_Old_Birthdate IS NOT NULL THEN 
              v_obirth_oid := plhdb.get_observation_oid(
                                          p_Old_Birthdate, NULL, 
                                          v_bterm_oid, v_ind_oid, 
                                          0);
       END IF;
       -- otherwise update the existing observation, or
       -- create new one of there wasn't one before
       PERFORM plhdb.get_observation_oid(p_Birthdate, NULL, p_BDMin, p_BDMax,
                                         plhdb.get_cvterm_oid(
                                                NULL, p_BDDist, NULL,
                                                'probability types', 
                                                'probability distribution', 0),
                                         v_bterm_oid, v_ind_oid,
                                         v_obirth_oid,
                                         3 -- allow DML
       );
       -- Update the recording period for entry and departure into and
       -- from observation, respectively.
       v_ret := upd_plhdb_recordingperiod(
                        v_ind_oid
                        , p_Entrydate, -1
                        , p_Entrytype
                        , p_Departdate, p_DepartdateError
                        , p_Departtype
                        , 'total observation period'
                        , v_ind_oid
                        , p_Old_Entrydate
                        , p_Old_Entrytype
                        , p_Old_Departdate
                        , p_Old_Departtype);
      RETURN v_ret;
END;
$$;


ALTER FUNCTION public.upd_biography_assocs(p_studyid character varying, p_animid character varying, p_animname character varying, p_birthgroup character varying, p_bgqual character, p_sex character, p_momid character varying, p_firstborn character, p_birthdate timestamp without time zone, p_bdmin timestamp without time zone, p_bdmax timestamp without time zone, p_bddist character varying, p_entrydate timestamp without time zone, p_entrytype character varying, p_departdate timestamp without time zone, p_departdateerror double precision, p_departtype character varying, p_old_studyid character varying, p_old_animid character varying, p_old_momid character varying, p_old_birthdate timestamp without time zone, p_old_entrydate timestamp without time zone, p_old_entrytype character varying, p_old_departdate timestamp without time zone, p_old_departtype character varying) OWNER TO plhdb_admin;

--
-- Name: upd_plhdb_recordingperiod(integer, timestamp without time zone, double precision, character varying, timestamp without time zone, double precision, character varying, character varying, integer, timestamp without time zone, character varying, timestamp without time zone, character varying); Type: FUNCTION; Schema: public; Owner: plhdb_admin
--

CREATE FUNCTION public.upd_plhdb_recordingperiod(p_anim_oid integer, p_startdate timestamp without time zone, p_startdate_error double precision, p_starttype character varying, p_stopdate timestamp without time zone, p_stopdate_error double precision, p_stoptype character varying, p_periodtype character varying, p_old_anim_oid integer, p_old_startdate timestamp without time zone, p_old_starttype character varying, p_old_stopdate timestamp without time zone, p_old_stoptype character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
      v_pterm_oid plhdb.cvterm.cvterm_oid%TYPE;
      v_ostart_oid plhdb.observation.observation_oid%TYPE;
      v_nstart_oid plhdb.observation.observation_oid%TYPE;
      v_oend_oid plhdb.observation.observation_oid%TYPE;
      v_nend_oid plhdb.observation.observation_oid%TYPE;
      v_ostart_type_oid plhdb.cvterm.cvterm_oid%TYPE;
      v_oend_type_oid plhdb.cvterm.cvterm_oid%TYPE;
BEGIN
       -- Update the recording period means under the current data model
       -- that we do have at least a start date, and there is a
       -- non-null recording period record to update.
       --
       -- To locate the existing recording period we will need the old
       -- start and end observation, as well as the period type term.
       v_pterm_oid := plhdb.get_cvterm_oid(p_Periodtype,
                                           NULL, NULL, 'period types', NULL,
                                           0);
       -- old and new start type might be identical, so let's store the
       -- primary key to possibly save a second lookup (note that this
       -- must exist)
       v_ostart_type_oid := plhdb.get_cvterm_oid(NULL, p_Old_Starttype,
                                                 NULL, 'event types',
                                                 'start of recording', 0);
       v_ostart_oid := plhdb.get_observation_oid(p_Old_Startdate, NULL, 
                                                 v_ostart_type_oid, 
                                                 p_Old_Anim_OID, 
                                                 0);
       -- the old end observation may be null (if there was no stop date)
       IF p_Old_Stopdate IS NOT NULL THEN
              -- similarly as for the start observation, the type of
              -- the end observation may not have changed, so save the
              -- value to possibly reuse it
              v_oend_type_oid := plhdb.get_cvterm_oid(NULL, p_Old_Stoptype,
                                                      NULL, 'event types',
                                                      'end of recording',
                                                      0);
              v_oend_oid := plhdb.get_observation_oid(p_Old_Stopdate, NULL,
                                                      v_oend_type_oid, 
                                                      p_Old_Anim_OID, 0);
       END IF;
       -- Since the start date is required, updating to an empty start
       -- date is not allowed (it will lead to a NOT NULL constraint
       -- error when executing the actual UPDATE).
       IF p_Startdate IS NOT NULL THEN
              -- update the start observation as needed
              v_nstart_oid := plhdb.get_observation_oid(
                       p_Startdate, p_Startdate_Error,
                       CASE WHEN p_Old_Starttype = p_Starttype THEN 
                                 v_ostart_type_oid
                            ELSE
                                 plhdb.get_cvterm_oid(NULL, p_Starttype, NULL,
                                                      'event types',
                                                      'start of recording',
                                                      0)
                       END,
                       p_Anim_OID,
                       v_ostart_oid,
                       3);
       END IF;
       -- if the departure date changes to null, we will simply
       -- update the recording period to set the end
       -- observation to null (default value for v_nend_oid),
       -- and don't bother updating the end observation itself
       IF p_Stopdate IS NOT NULL THEN
               -- otherwise update (or create) the end observation
               v_nend_oid := plhdb.get_observation_oid(
                       p_Stopdate, p_Stopdate_Error,
                       CASE WHEN p_Stoptype = p_Old_Stoptype THEN
                                 v_oend_type_oid
                            ELSE
                                 plhdb.get_cvterm_oid(NULL,p_Stoptype,
                                                      NULL,'event types',
                                                      'end of recording',
                                                      0)
                       END,
                       p_Anim_OID,
                       v_oend_oid,
                       3);
       END IF;
       -- finally, update the recording period (which according
       -- to our data model must exist if we are updating)
       UPDATE plhdb.recordingperiod SET
              start_oid = v_nstart_oid
              , end_oid = v_nend_oid
       WHERE start_oid = v_ostart_oid
       AND COALESCE(end_oid, -1) = COALESCE(v_oend_oid, -1)
       AND type_oid = v_pterm_oid;
       RETURN FOUND;
END;
$$;


ALTER FUNCTION public.upd_plhdb_recordingperiod(p_anim_oid integer, p_startdate timestamp without time zone, p_startdate_error double precision, p_starttype character varying, p_stopdate timestamp without time zone, p_stopdate_error double precision, p_stoptype character varying, p_periodtype character varying, p_old_anim_oid integer, p_old_startdate timestamp without time zone, p_old_starttype character varying, p_old_stopdate timestamp without time zone, p_old_stoptype character varying) OWNER TO plhdb_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dmltrace; Type: TABLE; Schema: audit; Owner: plhdb_admin
--

CREATE TABLE audit.dmltrace (
    dmltrace_oid integer NOT NULL,
    tablename character varying(64) NOT NULL,
    rowkey character varying(32) NOT NULL,
    optype character(1) NOT NULL,
    usr character varying(16) NOT NULL,
    tstamp timestamp without time zone,
    CONSTRAINT dmltrace_optype_check CHECK ((optype = ANY (ARRAY['I'::bpchar, 'U'::bpchar, 'D'::bpchar])))
);


ALTER TABLE audit.dmltrace OWNER TO plhdb_admin;

--
-- Name: TABLE dmltrace; Type: COMMENT; Schema: audit; Owner: plhdb_admin
--

COMMENT ON TABLE audit.dmltrace IS 'Simple table for tracking DML operations (inserts, updates, deletes). At present, timestamp is optional, but this may change in the future.';


--
-- Name: COLUMN dmltrace.tablename; Type: COMMENT; Schema: audit; Owner: plhdb_admin
--

COMMENT ON COLUMN audit.dmltrace.tablename IS 'The name of the table in which a row was changed, inserted, or deleted. Depending on the application, this may also be the name of a view.';


--
-- Name: COLUMN dmltrace.rowkey; Type: COMMENT; Schema: audit; Owner: plhdb_admin
--

COMMENT ON COLUMN audit.dmltrace.rowkey IS 'The primary or unique key to the row that was affected. For updates and deletes, this should point to the old values, before the change took affect.';


--
-- Name: COLUMN dmltrace.optype; Type: COMMENT; Schema: audit; Owner: plhdb_admin
--

COMMENT ON COLUMN audit.dmltrace.optype IS 'The type of DML operation that was executed, I, U, and D for Insert, Update, and Delete, respectively.';


--
-- Name: COLUMN dmltrace.usr; Type: COMMENT; Schema: audit; Owner: plhdb_admin
--

COMMENT ON COLUMN audit.dmltrace.usr IS 'The name of the user making the DML operation.';


--
-- Name: COLUMN dmltrace.tstamp; Type: COMMENT; Schema: audit; Owner: plhdb_admin
--

COMMENT ON COLUMN audit.dmltrace.tstamp IS 'The time at which the operation was executed.';


--
-- Name: dmltrace_dmltrace_oid_seq; Type: SEQUENCE; Schema: audit; Owner: plhdb_admin
--

CREATE SEQUENCE audit.dmltrace_dmltrace_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audit.dmltrace_dmltrace_oid_seq OWNER TO plhdb_admin;

--
-- Name: dmltrace_dmltrace_oid_seq; Type: SEQUENCE OWNED BY; Schema: audit; Owner: plhdb_admin
--

ALTER SEQUENCE audit.dmltrace_dmltrace_oid_seq OWNED BY audit.dmltrace.dmltrace_oid;


--
-- Name: account; Type: TABLE; Schema: auth; Owner: plhdb_admin
--

CREATE TABLE auth.account (
    user_oid integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(64) NOT NULL,
    create_date date,
    enable_disable_status character varying(1) NOT NULL,
    admin boolean DEFAULT false
);


ALTER TABLE auth.account OWNER TO plhdb_admin;

--
-- Name: account_user_oid_seq; Type: SEQUENCE; Schema: auth; Owner: plhdb_admin
--

CREATE SEQUENCE auth.account_user_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.account_user_oid_seq OWNER TO plhdb_admin;

--
-- Name: account_user_oid_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: plhdb_admin
--

ALTER SEQUENCE auth.account_user_oid_seq OWNED BY auth.account.user_oid;


--
-- Name: permission; Type: TABLE; Schema: auth; Owner: plhdb_admin
--

CREATE TABLE auth.permission (
    permission_oid integer NOT NULL,
    access character varying(10) NOT NULL,
    study character varying(64) NOT NULL,
    user_oid integer NOT NULL
);


ALTER TABLE auth.permission OWNER TO plhdb_admin;

--
-- Name: permission_permission_oid_seq; Type: SEQUENCE; Schema: auth; Owner: plhdb_admin
--

CREATE SEQUENCE auth.permission_permission_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.permission_permission_oid_seq OWNER TO plhdb_admin;

--
-- Name: permission_permission_oid_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: plhdb_admin
--

ALTER SEQUENCE auth.permission_permission_oid_seq OWNED BY auth.permission.permission_oid;


--
-- Name: biography_imp; Type: TABLE; Schema: bulkimp; Owner: plhdb_admin
--

CREATE TABLE bulkimp.biography_imp (
    studyid character varying(12),
    animid character varying(16),
    animname character varying(128),
    birthgroup character varying(32),
    bgqual character(1),
    sex character(1),
    momid character varying(16),
    firstborn character(1),
    birthdate timestamp without time zone,
    bdmin timestamp without time zone,
    bdmax timestamp without time zone,
    bddist character varying(8),
    entrydate timestamp without time zone,
    entrytype character varying(8),
    departdate timestamp without time zone,
    departdateerror double precision,
    departtype character varying(8),
    anim_oid integer
);


ALTER TABLE bulkimp.biography_imp OWNER TO plhdb_admin;

--
-- Name: femalefertilityinterval_imp; Type: TABLE; Schema: bulkimp; Owner: plhdb_admin
--

CREATE TABLE bulkimp.femalefertilityinterval_imp (
    studyid character varying(12),
    animid character varying(16),
    startdate timestamp without time zone,
    starttype character varying(8),
    stopdate timestamp without time zone,
    stoptype character varying(8),
    anim_oid integer,
    interval_oid integer
);


ALTER TABLE bulkimp.femalefertilityinterval_imp OWNER TO plhdb_admin;

--
-- Name: studyinfo_imp; Type: TABLE; Schema: bulkimp; Owner: plhdb_admin
--

CREATE TABLE bulkimp.studyinfo_imp (
    studyid character varying(12),
    commonname character varying(64),
    sciname character varying(128),
    siteid character varying(64),
    owners character varying(128),
    latitude numeric(7,3),
    longitude numeric(7,3)
);


ALTER TABLE bulkimp.studyinfo_imp OWNER TO plhdb_admin;

--
-- Name: cvterm; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.cvterm (
    cvterm_oid integer NOT NULL,
    name character varying(64) NOT NULL,
    code character varying(8),
    identifier character varying(16),
    namespace character varying(32) NOT NULL
);


ALTER TABLE plhdb.cvterm OWNER TO plhdb_admin;

--
-- Name: TABLE cvterm; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.cvterm IS 'Controlled vocabulary and ontology terms. For simplicity, the name of the vocabulary or ontology is in the column namespace (and hence not normalized). Also, terms may have a short code (which need not be unique).';


--
-- Name: COLUMN cvterm.name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.cvterm.name IS 'Name of the term. Must be unique within a namespace.';


--
-- Name: COLUMN cvterm.code; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.cvterm.code IS 'An optional code for the name, often only a single letter or number. Note that this need not be unique within a namespace.';


--
-- Name: COLUMN cvterm.identifier; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.cvterm.identifier IS 'Identifier (in OBO speak called primary dbxref) of the term. If provided, must be unique among all terms.';


--
-- Name: COLUMN cvterm.namespace; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.cvterm.namespace IS 'The name of the controlled vocabulary or ontology to which a term belongs.';


--
-- Name: cvterm_cvterm_oid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.cvterm_cvterm_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.cvterm_cvterm_oid_seq OWNER TO plhdb_admin;

--
-- Name: cvterm_cvterm_oid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.cvterm_cvterm_oid_seq OWNED BY plhdb.cvterm.cvterm_oid;


--
-- Name: cvterm_relationship; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.cvterm_relationship (
    cvterm_relationship_oid integer NOT NULL,
    subject_oid integer NOT NULL,
    object_oid integer NOT NULL,
    predicate_oid integer NOT NULL
);


ALTER TABLE plhdb.cvterm_relationship OWNER TO plhdb_admin;

--
-- Name: TABLE cvterm_relationship; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.cvterm_relationship IS 'Relationships between ontology terms as subject, predicate, object triples. This triple table is slightly simplified as only one relationship type (predicate) is allowed between a given subject/object pair (though different pairs can have different predicates).';


--
-- Name: COLUMN cvterm_relationship.subject_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.cvterm_relationship.subject_oid IS 'The subject term of the relationship.';


--
-- Name: COLUMN cvterm_relationship.object_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.cvterm_relationship.object_oid IS 'The object term of the relationship.';


--
-- Name: COLUMN cvterm_relationship.predicate_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.cvterm_relationship.predicate_oid IS 'The predicate term of the relationship.';


--
-- Name: cvterm_relationship_cvterm_relationship_oid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.cvterm_relationship_cvterm_relationship_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.cvterm_relationship_cvterm_relationship_oid_seq OWNER TO plhdb_admin;

--
-- Name: cvterm_relationship_cvterm_relationship_oid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.cvterm_relationship_cvterm_relationship_oid_seq OWNED BY plhdb.cvterm_relationship.cvterm_relationship_oid;


--
-- Name: cvterm_relationships; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
--

CREATE VIEW plhdb.cvterm_relationships AS
 SELECT s.cvterm_oid AS subj_oid,
    s.name AS subj_name,
    s.code AS subj_code,
    s.identifier AS subj_identifier,
    s.namespace AS subj_namespace,
    p.cvterm_oid AS pred_oid,
    p.name AS pred_name,
    p.code AS pred_code,
    p.identifier AS pred_identifier,
    p.namespace AS pred_namespace,
    o.cvterm_oid AS obj_oid,
    o.name AS obj_name,
    o.code AS obj_code,
    o.identifier AS obj_identifier,
    o.namespace AS obj_namespace,
    rel.cvterm_relationship_oid AS rel_oid
   FROM (((plhdb.cvterm_relationship rel
     JOIN plhdb.cvterm s ON ((rel.subject_oid = s.cvterm_oid)))
     JOIN plhdb.cvterm p ON ((rel.predicate_oid = p.cvterm_oid)))
     JOIN plhdb.cvterm o ON ((rel.object_oid = o.cvterm_oid)));


ALTER TABLE plhdb.cvterm_relationships OWNER TO plhdb_admin;

--
-- Name: individual; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.individual (
    individual_oid integer NOT NULL,
    name character varying(128),
    id character varying(16) NOT NULL,
    sex character(1),
    birthgroup character varying(32),
    birthgroup_certainty character(1),
    is_first_born character(1),
    study_oid integer NOT NULL,
    CONSTRAINT individual_birthgroup_certainty_check CHECK (((birthgroup_certainty = 'C'::bpchar) OR (birthgroup_certainty = 'U'::bpchar))),
    CONSTRAINT individual_is_first_born_check CHECK ((is_first_born = ANY (ARRAY['Y'::bpchar, 'N'::bpchar, 'U'::bpchar]))),
    CONSTRAINT individual_sex_check CHECK ((sex = ANY (ARRAY['M'::bpchar, 'F'::bpchar, 'U'::bpchar])))
);


ALTER TABLE plhdb.individual OWNER TO plhdb_admin;

--
-- Name: TABLE individual; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.individual IS 'The individuals that are the subject of observation, such as the animals in an animal life history study. At present, animals can be the subject of only one study; in the future this restriction may need to be lifted. Also, birth groups are recorded directly as an attribute, and hence are denormalized, but at present it is unclear which attributes other than a name a birth group would need to have.';


--
-- Name: COLUMN individual.name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual.name IS 'The (long) name of the individual, which must be unique within a study if provided.';


--
-- Name: COLUMN individual.id; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual.id IS 'The ID or codename or barcode of the individual, which must be unique within the study.';


--
-- Name: COLUMN individual.sex; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual.sex IS 'The gender of the individual. Allowed values are M, F, and U, for male, female, and unknown, respectively. Null values are allowed, meaning that the sex has not been determined.';


--
-- Name: COLUMN individual.birthgroup; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual.birthgroup IS 'Where applicable, the name or code or ID of the group within which the individual was born. May not apply to a study.';


--
-- Name: COLUMN individual.birthgroup_certainty; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual.birthgroup_certainty IS 'Whether the birth group assignment is certain (C) or uncertain (U).';


--
-- Name: COLUMN individual.is_first_born; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual.is_first_born IS 'Whether the individual is the first born or first offspring from the maternal parent. Values are Y, N, and U, for Yes, No, and Unknown, respectively. Null value is allowed and means that the attribute does not apply.';


--
-- Name: COLUMN individual.study_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual.study_oid IS 'The study in which this individual was observed.';


--
-- Name: individual_individual_oid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.individual_individual_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.individual_individual_oid_seq OWNER TO plhdb_admin;

--
-- Name: individual_individual_oid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.individual_individual_oid_seq OWNED BY plhdb.individual.individual_oid;


--
-- Name: individual_relationship; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.individual_relationship (
    individual_relationship_oid integer NOT NULL,
    parent_oid integer NOT NULL,
    child_oid integer NOT NULL,
    reltype character varying(16) NOT NULL,
    CONSTRAINT individual_relationship_reltype_check CHECK ((((reltype)::text = 'maternal parent'::text) OR ((reltype)::text = 'paternal parent'::text)))
);


ALTER TABLE plhdb.individual_relationship OWNER TO plhdb_admin;

--
-- Name: TABLE individual_relationship; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.individual_relationship IS 'Parental relationships between individuals.';


--
-- Name: COLUMN individual_relationship.parent_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationship.parent_oid IS 'The parental individual in the relationship.';


--
-- Name: COLUMN individual_relationship.child_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationship.child_oid IS 'The offspring individual in the relationship.';


--
-- Name: COLUMN individual_relationship.reltype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationship.reltype IS 'The nature of the relationship, currently either ''maternal parent'' or ''paternal parent''.';


--
-- Name: individual_relationship_individual_relationship_oid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.individual_relationship_individual_relationship_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.individual_relationship_individual_relationship_oid_seq OWNER TO plhdb_admin;

--
-- Name: individual_relationship_individual_relationship_oid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.individual_relationship_individual_relationship_oid_seq OWNED BY plhdb.individual_relationship.individual_relationship_oid;


--
-- Name: study; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.study (
    study_oid integer NOT NULL,
    name character varying(32),
    id character varying(12) NOT NULL,
    owners character varying(128),
    taxon_oid integer NOT NULL,
    site_oid integer NOT NULL
);


ALTER TABLE plhdb.study OWNER TO plhdb_admin;

--
-- Name: TABLE study; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.study IS 'The study within which the individuals have been observed. At present, the same taxon and the same site applies to all individuals within the study.';


--
-- Name: COLUMN study.name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.name IS 'The name of the study. This may be a descriptive or an encoded and must be unique if provided.';


--
-- Name: COLUMN study.id; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.id IS 'A short identifier commonly used to refer to the study. This need not be a number, but must be unique, and is required.';


--
-- Name: COLUMN study.owners; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.owners IS 'The owners of the observational data that this study gave rise to. This may be a single person, an organization, or a (comma-delimited) list of such.';


--
-- Name: COLUMN study.taxon_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.taxon_oid IS 'The taxon for the individuals that were or are being observed in this study.';


--
-- Name: COLUMN study.site_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.site_oid IS 'The site where this study was or is being conducted, and where hence the individuals have been observed.';


--
-- Name: individual_relationships; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
--

CREATE VIEW plhdb.individual_relationships AS
 SELECT rel.parent_oid,
    p.name AS parent_name,
    p.id AS parent_id,
    rel.child_oid,
    c.name AS child_name,
    c.id AS child_id,
    rel.reltype,
    st.study_oid,
    st.name AS study_name,
    st.id AS study_id
   FROM (((plhdb.individual_relationship rel
     JOIN plhdb.individual p ON ((p.individual_oid = rel.parent_oid)))
     JOIN plhdb.individual c ON ((c.individual_oid = rel.child_oid)))
     JOIN plhdb.study st ON ((c.study_oid = st.study_oid)));


ALTER TABLE plhdb.individual_relationships OWNER TO plhdb_admin;

--
-- Name: VIEW individual_relationships; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON VIEW plhdb.individual_relationships IS 'Parent and child individuals connected by a certain relationship type.';


--
-- Name: COLUMN individual_relationships.parent_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.parent_oid IS 'The primary key of the parent individual.';


--
-- Name: COLUMN individual_relationships.parent_name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.parent_name IS 'The (long) name of the parent individual.';


--
-- Name: COLUMN individual_relationships.parent_id; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.parent_id IS 'The ID or codename or barcode of the parent individual.';


--
-- Name: COLUMN individual_relationships.child_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.child_oid IS 'The primary key of the child individual.';


--
-- Name: COLUMN individual_relationships.child_name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.child_name IS 'The (long) name of the child individual.';


--
-- Name: COLUMN individual_relationships.child_id; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.child_id IS 'The ID or codename or barcode of the child individual.';


--
-- Name: COLUMN individual_relationships.reltype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.reltype IS 'The nature of the relationship, currently either ''maternal parent'' or ''paternal parent''.';


--
-- Name: COLUMN individual_relationships.study_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.study_oid IS 'The primary key of the study to which the child individual belongs.';


--
-- Name: COLUMN individual_relationships.study_name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.study_name IS 'The name of the study to which the child individual belongs.';


--
-- Name: COLUMN individual_relationships.study_id; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.individual_relationships.study_id IS 'The ID of the study to which the child individual belongs.';


--
-- Name: observation; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.observation (
    observation_oid integer NOT NULL,
    time_of_observation timestamp without time zone NOT NULL,
    time_error double precision,
    min_boundary timestamp without time zone,
    max_boundary timestamp without time zone,
    prob_type_oid integer,
    type_oid integer NOT NULL,
    individual_oid integer NOT NULL
);


ALTER TABLE plhdb.observation OWNER TO plhdb_admin;

--
-- Name: TABLE observation; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.observation IS 'An observation for or of an individual. An observation may start a period during which an individual has a certain property (such as disease) or capacity (such as fertility), or may mark the beginning or end of the period over which an individual has been part of the study, or may represent a singular event (such as birth, or death).';


--
-- Name: COLUMN observation.time_of_observation; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observation.time_of_observation IS 'The time or date when the observation was made.';


--
-- Name: COLUMN observation.time_error; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observation.time_error IS 'The error with which the time is being stated, meaning that the actual time may have been between the recorded time minus the error to the recorded time plus the error. The unit of error will depend on the study, but should be uniform within a study, for example (fraction of) years, or days.';


--
-- Name: COLUMN observation.min_boundary; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observation.min_boundary IS 'The (typically estimated) earliest time at which the observed event could have taken place.';


--
-- Name: COLUMN observation.max_boundary; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observation.max_boundary IS 'The (typically estimated) latest time at which the observed event could have taken place.';


--
-- Name: COLUMN observation.prob_type_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observation.prob_type_oid IS 'The probability distribution or function describing the actual time of the event between the min (lower) boundary and the max (upper) boundary. If this is non-null, min and max boundary need to have values too.';


--
-- Name: COLUMN observation.type_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observation.type_oid IS 'The type of the event, such as birth, or death, or feeding.';


--
-- Name: COLUMN observation.individual_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observation.individual_oid IS 'The individual for which the observation was made.';


--
-- Name: observation_observation_oid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.observation_observation_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.observation_observation_oid_seq OWNER TO plhdb_admin;

--
-- Name: observation_observation_oid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.observation_observation_oid_seq OWNED BY plhdb.observation.observation_oid;


--
-- Name: observations; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
--

CREATE VIEW plhdb.observations AS
 SELECT os.observation_oid,
    os.time_of_observation,
    os.time_error,
    os.min_boundary,
    os.max_boundary,
    osprob.name AS prob_type,
    osprob.code AS prob_type_code,
    ost.name AS event_type,
    ost.code AS event_code,
    ostp.name AS event_type_parent,
    ost.namespace AS event_type_namespace,
    os.individual_oid
   FROM ((((plhdb.observation os
     JOIN plhdb.cvterm ost ON ((os.type_oid = ost.cvterm_oid)))
     JOIN plhdb.cvterm_relationship cvr ON ((ost.cvterm_oid = cvr.subject_oid)))
     JOIN plhdb.cvterm ostp ON ((cvr.object_oid = ostp.cvterm_oid)))
     LEFT JOIN plhdb.cvterm osprob ON ((os.prob_type_oid = osprob.cvterm_oid)));


ALTER TABLE plhdb.observations OWNER TO plhdb_admin;

--
-- Name: VIEW observations; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON VIEW plhdb.observations IS 'Observations and their type, as well as parent term of the type, cast here as the ''category'' of the type.';


--
-- Name: COLUMN observations.observation_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.observation_oid IS 'The primary key of the observation.';


--
-- Name: COLUMN observations.time_of_observation; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.time_of_observation IS 'The time or date when the observation was made.';


--
-- Name: COLUMN observations.time_error; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.time_error IS 'The error with which the time is being stated, meaning that the actual time may have been between the recorded time minus the error to the recorded time plus the error. The unit of error will depend on the study, but should be uniform within a study, for example (fraction of) years, or days.';


--
-- Name: COLUMN observations.min_boundary; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.min_boundary IS 'The (typically estimated) earliest time at which the observed event could have taken place.';


--
-- Name: COLUMN observations.max_boundary; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.max_boundary IS 'The (typically estimated) latest time at which the observed event could have taken place.';


--
-- Name: COLUMN observations.prob_type; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.prob_type IS 'The (type of) probability distribution or function describing the actual time of the event between the min (lower) boundary and the max (upper) boundary.';


--
-- Name: COLUMN observations.prob_type_code; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.prob_type_code IS 'The (usually single-letter) code of the probability distribution describing the actual time of the event.';


--
-- Name: COLUMN observations.event_type; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.event_type IS 'The name of the type of the event, such as birth, or death, or feeding.';


--
-- Name: COLUMN observations.event_code; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.event_code IS 'The (optional) code for the name of the event type, often only a single letter or number.';


--
-- Name: COLUMN observations.event_type_parent; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.event_type_parent IS 'The parent term name of the type of the event, such as ''start of recording'' or ''end of recording'', representing categories of event types. Note that event types without parent terms will not match the query of this view.';


--
-- Name: COLUMN observations.event_type_namespace; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.event_type_namespace IS 'The name of the controlled vocabulary or ontology to which the event type belongs.';


--
-- Name: COLUMN observations.individual_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.observations.individual_oid IS 'The individual for which the observation was made.';


--
-- Name: recordingperiod; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.recordingperiod (
    recordingperiod_oid integer NOT NULL,
    start_oid integer NOT NULL,
    end_oid integer,
    type_oid integer NOT NULL
);


ALTER TABLE plhdb.recordingperiod OWNER TO plhdb_admin;

--
-- Name: TABLE recordingperiod; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.recordingperiod IS 'A period of time created by an observation that starts the period and one that ends it. The combination of starting and ending observation and type is unique. A period of time may be continuous, such as one during with an individual has a certain property (for example, disease) or a capacity (for example, fertility), or it may be implicitly discontinuous, such as the total observation period if it has intervening gaps.';


--
-- Name: COLUMN recordingperiod.start_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiod.start_oid IS 'The observation that starts the recording period.';


--
-- Name: COLUMN recordingperiod.end_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiod.end_oid IS 'The observation that ends the period.';


--
-- Name: COLUMN recordingperiod.type_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiod.type_oid IS 'The type of the recording period, such as the property (for example, a disease) or the capacity (for example, fertility) that the individual had during the period.';


--
-- Name: recordingperiod_recordingperiod_oid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.recordingperiod_recordingperiod_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.recordingperiod_recordingperiod_oid_seq OWNER TO plhdb_admin;

--
-- Name: recordingperiod_recordingperiod_oid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.recordingperiod_recordingperiod_oid_seq OWNED BY plhdb.recordingperiod.recordingperiod_oid;


--
-- Name: recordingperiods; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
--

CREATE VIEW plhdb.recordingperiods AS
 SELECT os.individual_oid,
    os.observation_oid AS start_observation_oid,
    os.time_of_observation AS start_time,
    os.time_error AS start_time_error,
    ost.name AS start_event_type,
    ost.code AS start_event_code,
    ost.namespace AS start_event_type_namespace,
    oe.observation_oid AS end_observation_oid,
    oe.time_of_observation AS end_time,
    oe.time_error AS end_time_error,
    oet.name AS end_event_type,
    oet.code AS end_event_code,
    oet.namespace AS end_event_type_namespace,
    pert.name AS period_type,
    per.recordingperiod_oid AS period_oid
   FROM (((((plhdb.recordingperiod per
     JOIN plhdb.cvterm pert ON ((per.type_oid = pert.cvterm_oid)))
     JOIN plhdb.observation os ON ((per.start_oid = os.observation_oid)))
     JOIN plhdb.cvterm ost ON ((os.type_oid = ost.cvterm_oid)))
     LEFT JOIN plhdb.observation oe ON ((per.end_oid = oe.observation_oid)))
     LEFT JOIN plhdb.cvterm oet ON ((oe.type_oid = oet.cvterm_oid)));


ALTER TABLE plhdb.recordingperiods OWNER TO plhdb_admin;

--
-- Name: VIEW recordingperiods; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON VIEW plhdb.recordingperiods IS 'Recording periods with start and end observations, types of those observations, and the type of the period. The end observation (and its attributes) may be null.';


--
-- Name: COLUMN recordingperiods.individual_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.individual_oid IS 'The database primary key of the individual for which the observation was made.';


--
-- Name: COLUMN recordingperiods.start_observation_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.start_observation_oid IS 'The primary key of the observation that starts the recording period.';


--
-- Name: COLUMN recordingperiods.start_time; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.start_time IS 'The time or date when the start observation was made.';


--
-- Name: COLUMN recordingperiods.start_time_error; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.start_time_error IS 'The error with which the start time is being stated, meaning that the actual time may have been between the recorded time minus the error to the recorded time plus the error. The unit of error will depend on the study, but should be uniform within a study, for example (fraction of) years, or days.';


--
-- Name: COLUMN recordingperiods.start_event_type; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.start_event_type IS 'The name of the type of the start event, such as birth, or death, or feeding.';


--
-- Name: COLUMN recordingperiods.start_event_code; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.start_event_code IS 'The (optional) code for the name of the start event type, often only a single letter or number.';


--
-- Name: COLUMN recordingperiods.start_event_type_namespace; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.start_event_type_namespace IS 'The name of the controlled vocabulary or ontology to which the start event type belongs.';


--
-- Name: COLUMN recordingperiods.end_observation_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.end_observation_oid IS 'The primary key of the observation that ends the recording period.';


--
-- Name: COLUMN recordingperiods.end_time; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.end_time IS 'The time or date when the end observation was made.';


--
-- Name: COLUMN recordingperiods.end_time_error; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.end_time_error IS 'The error with which the end time is being stated, meaning that the actual time may have been between the recorded time minus the error to the recorded time plus the error. The unit of error will depend on the study, but should be uniform within a study, for example (fraction of) years, or days.';


--
-- Name: COLUMN recordingperiods.end_event_type; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.end_event_type IS 'The name of the type of the end event, such as birth, or death, or feeding.';


--
-- Name: COLUMN recordingperiods.end_event_code; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.end_event_code IS 'The (optional) code for the name of the end event type, often only a single letter or number.';


--
-- Name: COLUMN recordingperiods.end_event_type_namespace; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.end_event_type_namespace IS 'The name of the controlled vocabulary or ontology to which the end event type belongs.';


--
-- Name: COLUMN recordingperiods.period_type; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.period_type IS 'The name of the type of the recording period, such as the property (for example, a disease) or the capacity (for example, fertility) that the individual had during the period.';


--
-- Name: COLUMN recordingperiods.period_oid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.recordingperiods.period_oid IS 'The database primary key of the recording period.';


--
-- Name: site; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.site (
    site_oid integer NOT NULL,
    name character varying(64) NOT NULL,
    latitude numeric(7,3),
    longitude numeric(7,3),
    geodetic_datum character varying(12) DEFAULT 'WGS84'::character varying
);


ALTER TABLE plhdb.site OWNER TO plhdb_admin;

--
-- Name: TABLE site; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.site IS 'The site where the study was or is being conducted. For now, geographic coordinates are designated to the entire site, not individually to observations (though that would seem desirable over the long term). It would also seem desirable to record the geographic area of the site as a polygon, rather than as a single point.';


--
-- Name: COLUMN site.name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.site.name IS 'The name of the site, which must be unique. This may be a short or a long name, depending on what the study uses.';


--
-- Name: COLUMN site.latitude; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.site.latitude IS 'The decimal latitude coordinate of the site, using positive and negative sign to indicate N and S, respectively.';


--
-- Name: COLUMN site.longitude; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.site.longitude IS 'The decimal longitude coordinate of the site, using positive and negative sign to indicate E and W, respectively.';


--
-- Name: COLUMN site.geodetic_datum; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.site.geodetic_datum IS 'The geodetic system on which the geo-coordinates are based. For geo-coordinates measured between 1984 and 2010, this will typically be WGS84 and is the default value.';


--
-- Name: site_site_oid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.site_site_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.site_site_oid_seq OWNER TO plhdb_admin;

--
-- Name: site_site_oid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.site_site_oid_seq OWNED BY plhdb.site.site_oid;


--
-- Name: study_study_oid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.study_study_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.study_study_oid_seq OWNER TO plhdb_admin;

--
-- Name: study_study_oid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.study_study_oid_seq OWNED BY plhdb.study.study_oid;


--
-- Name: taxon; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.taxon (
    taxon_oid integer NOT NULL,
    scientific_name character varying(128) NOT NULL,
    common_name character varying(64)
);


ALTER TABLE plhdb.taxon OWNER TO plhdb_admin;

--
-- Name: TABLE taxon; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.taxon IS 'The taxon of the individuals (animals, plants, etc) being studied. For now, this is a very simplified taxon model with no identification of the taxonomy being used, and there can be only two names, one scientific and one common.';


--
-- Name: COLUMN taxon.scientific_name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.taxon.scientific_name IS 'The scientific name for the taxon, using for example the NCBI or the ITIS taxonomies.';


--
-- Name: COLUMN taxon.common_name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.taxon.common_name IS 'The common name for the taxon. This need not be the most common or generally accepted name, but the common name used within the study.';


--
-- Name: taxon_taxon_oid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.taxon_taxon_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.taxon_taxon_oid_seq OWNER TO plhdb_admin;

--
-- Name: taxon_taxon_oid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.taxon_taxon_oid_seq OWNED BY plhdb.taxon.taxon_oid;


--
-- Name: biography; Type: VIEW; Schema: public; Owner: plhdb_admin
--

CREATE VIEW public.biography AS
 SELECT st.id AS studyid,
    an.id AS animid,
    an.name AS animname,
    an.birthgroup,
    an.birthgroup_certainty AS bgqual,
    an.sex,
    momrel.parent_id AS momid,
    an.is_first_born AS firstborn,
    bo.time_of_observation AS birthdate,
    bo.min_boundary AS bdmin,
    bo.max_boundary AS bdmax,
    bo.prob_type_code AS bddist,
    per.start_time AS entrydate,
    per.start_event_code AS entrytype,
    per.end_time AS departdate,
    per.end_time_error AS departdateerror,
    per.end_event_code AS departtype,
    an.individual_oid AS anim_oid
   FROM ((((plhdb.individual an
     JOIN plhdb.study st ON ((an.study_oid = st.study_oid)))
     JOIN plhdb.recordingperiods per ON (((per.individual_oid = an.individual_oid) AND ((per.period_type)::text = 'total observation period'::text))))
     JOIN plhdb.observations bo ON (((bo.individual_oid = an.individual_oid) AND ((bo.event_type)::text = 'date of birth'::text) AND ((bo.event_type_namespace)::text = 'event types'::text))))
     LEFT JOIN plhdb.individual_relationships momrel ON ((an.individual_oid = momrel.child_oid)));


ALTER TABLE public.biography OWNER TO plhdb_admin;

--
-- Name: VIEW biography; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON VIEW public.biography IS 'PLHD API: Biography of an animal.';


--
-- Name: COLUMN biography.studyid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.studyid IS 'Study number. Each study is assigned an arbitrary identifying number that is an integer.';


--
-- Name: COLUMN biography.animid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.animid IS 'ID, Code not long name. The only ones in here are the seen products of live births.';


--
-- Name: COLUMN biography.animname; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.animname IS 'Long name.';


--
-- Name: COLUMN biography.birthgroup; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.birthgroup IS 'Group of birth, characters. ID of the group or unknown.';


--
-- Name: COLUMN biography.bgqual; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.bgqual IS 'Quality of the estimate of the group of birth. The degree of certainty about which group this animal was born into. Character: C or U for certain or uncertain.';


--
-- Name: COLUMN biography.sex; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.sex IS 'Sex M, F or U for Male, Female or Unknown respectively. Character';


--
-- Name: COLUMN biography.momid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.momid IS 'Mother''s ID. Mother''s AnimID or unknown. Character. Values in this column may or may not also occur in the AnimID column in another row.';


--
-- Name: COLUMN biography.firstborn; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.firstborn IS 'Is this animal its mother''s first born. Y, N, U for Yes, No or Uncertain respectively. Character.';


--
-- Name: COLUMN biography.birthdate; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.birthdate IS 'Birth date. Animal''s birthdate. The birthdate is either the exactly known date of birth or it is midpoint of the range of possible birthdates. Date: dd-Mmm-yyyy';


--
-- Name: COLUMN biography.bdmin; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.bdmin IS 'Estimated earliest birth date. Must differ from Birthdate whenever earliest possible birth date is >7 days before Birthdate. Format: dd-Mmm-yyyy';


--
-- Name: COLUMN biography.bdmax; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.bdmax IS 'Estimated latest birth date.  Must differ from Birthdate whenever latest possible birth date is >7 days after Birthdate.  Format: dd-Mmm-yyyy';


--
-- Name: COLUMN biography.bddist; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.bddist IS 'Probability distribution of the estimated birth date given BDMin, Birthdate, and BDMax. Must be either normal (N) or uniform (U). If N, construct the probability distribution so that BDMin and BDMax represent + 2 standard deviations of Birthdate. If U, the probability distribution is truncated at BDMin and BDMax with equal Birthdate probability within this range. If Birthdate is not at the midpoint of BDMin and BDMax, distribution must be U. If Birthdate is at the midpoint of BDMin and BDMax, distribution may be N or U.';


--
-- Name: COLUMN biography.entrydate; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.entrydate IS 'Date the animal was first seen. Date: dd-Mmm-yyyy. Date on which the animal is first sighted in the study population, either because the animal is recognized and ID''d as of that date or because strong inference indicates group membership from that date. Study population is the studied population at the time of the animal''s entry it it. You are allowed to have entrydate = birthdate if bderror = 0.';


--
-- Name: COLUMN biography.entrytype; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.entrytype IS 'Type of entry into population. Birth, immigration, start of confirmed ID, Initiation of close observation for any other reason. B, I, C, O for birth, immigration into the study population, confirmed ID, and beginning of observation, respectively.';


--
-- Name: COLUMN biography.departdate; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.departdate IS 'Date: dd-Mmm-yyyy. Date on which the animal was last seen alive in the population.';


--
-- Name: COLUMN biography.departdateerror; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.departdateerror IS 'Time between departdate and the first time that the animal was confirmed missing. Expressed as fraction of a year (number of days divided by number of days in a year).	Assign a zero to DepartdateError only if the number of day between departdate and the first time that the animal was confirmed missing was < 15.';


--
-- Name: COLUMN biography.departtype; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.departtype IS 'Type of departure. D, E, P, O for death, emigration, permanent disappearance and end of observation respectively. Character. Death, permanent disappearance, emigration out of the study population, end of close observation for any other reason, or end of currently entered data period. May be same as Type of Stop in FertilityTable. Death may be assigned only in cases where the evidence is very strong: body found, or circumstantial evidence indicates poor health or other risks contributing to mortality and/or violations of population-specific behavior patterns. Otherwise assign permanent disappearance. Do not assign mortality based solely on inferred risks associated with age.';


--
-- Name: COLUMN biography.anim_oid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.biography.anim_oid IS 'Internal primary key of the animal. Can be used for joining to FemaleFertilityInterval.';


--
-- Name: femalefertilityinterval; Type: VIEW; Schema: public; Owner: plhdb_admin
--

CREATE VIEW public.femalefertilityinterval AS
 SELECT st.id AS studyid,
    an.id AS animid,
    per.start_time AS startdate,
    per.start_event_code AS starttype,
    per.end_time AS stopdate,
    per.end_event_code AS stoptype,
    an.individual_oid AS anim_oid,
    per.period_oid AS interval_oid
   FROM ((plhdb.recordingperiods per
     JOIN plhdb.individual an ON ((per.individual_oid = an.individual_oid)))
     JOIN plhdb.study st ON ((an.study_oid = st.study_oid)))
  WHERE ((per.period_type)::text = 'female fertility period'::text);


ALTER TABLE public.femalefertilityinterval OWNER TO plhdb_admin;

--
-- Name: VIEW femalefertilityinterval; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON VIEW public.femalefertilityinterval IS 'PLHD API: Observed fertility interval of a female animal. The natural unique key of this view is the combination of animal OID, start time and type, and stop date and type. Hence it includes all columns except the primary key column.';


--
-- Name: COLUMN femalefertilityinterval.studyid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.femalefertilityinterval.studyid IS 'ID of the study. The combination of studyID and animID uniquely identifies an animal (as does Anim_OID, the primary key of the animal).';


--
-- Name: COLUMN femalefertilityinterval.animid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.femalefertilityinterval.animid IS 'ID of animal. Every female is required to have an entry. Males may not have entries. All values in this cell must correspond to a value in Biography. Note that in the current data model this column is not guaranteed to uniquely identify the animal as animals from different studies may have the same ID (but not within the same study). Use the animal OID as unique key for the animal.';


--
-- Name: COLUMN femalefertilityinterval.startdate; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.femalefertilityinterval.startdate IS 'Startdate for fertility surveillance. Date on which surveillance of fertility began. Will be equivalent to Entrydate in Biography if this is equivalent to the first time you saw the animal. Will be equivalent to Birthdate in Biography iff Entrydate = Birthdate. This date must not have error associated with it. These dates are conservative: if you are sure that you know about her starting on July 15 but you MIGHT know about her starting on July 1, you must choose the more conservative date which is July 15.';


--
-- Name: COLUMN femalefertilityinterval.starttype; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.femalefertilityinterval.starttype IS 'Reason for the start of surveillance. Birth, immigration, start of confirmed ID, Initiation of close observation for any other reason. B, I, C, O for birth, immigration into the study population, confirmed ID, and beginning of observation, respectively.';


--
-- Name: COLUMN femalefertilityinterval.stopdate; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.femalefertilityinterval.stopdate IS 'Stopdate for fertility surveillance. Date on which surveillance of fertility ended. Surveillance ends when you stop seeing the animal for a long enough period of time that births could be missed. This is allowed to be  equivalent to Departdate in Biography only when this is  the last time you saw the animal alive. This date must not have error associated with it. These dates are conservative: if you are sure that you know about her until July 1 but you MIGHT know about her until  July 15, you must choose the more conservative date which is July 1.';


--
-- Name: COLUMN femalefertilityinterval.stoptype; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.femalefertilityinterval.stoptype IS 'Cause of the end of surveillance. Cause of the end of surveillance. D, E, P, O for death, emigration, permanent disappearance and end of observation respectively. Character.';


--
-- Name: COLUMN femalefertilityinterval.anim_oid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.femalefertilityinterval.anim_oid IS 'Internal primary key of the animal, and hence uniquely identifies it. Can be used for joining to Biography.';


--
-- Name: COLUMN femalefertilityinterval.interval_oid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.femalefertilityinterval.interval_oid IS 'Internal primary key of the fertility interval. Can be used for uniquely identifying a fertility interval with a single value.';


--
-- Name: studyinfo; Type: VIEW; Schema: public; Owner: plhdb_admin
--

CREATE VIEW public.studyinfo AS
 SELECT st.id AS studyid,
    tax.common_name AS commonname,
    tax.scientific_name AS sciname,
    site.name AS siteid,
    st.owners,
    site.latitude,
    site.longitude
   FROM ((plhdb.study st
     JOIN plhdb.taxon tax ON ((st.taxon_oid = tax.taxon_oid)))
     JOIN plhdb.site ON ((st.site_oid = site.site_oid)));


ALTER TABLE public.studyinfo OWNER TO plhdb_admin;

--
-- Name: VIEW studyinfo; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON VIEW public.studyinfo IS 'PLHD API: Information about the studies.';


--
-- Name: COLUMN studyinfo.studyid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.studyinfo.studyid IS 'Study number. 1 is Strier/muriquis, 2 is Pat Wright, 3 is Marina, 4 is Anne Pusey, 5 is Tara Stoinski, 6 is Diane Brockman, 7 is Linda Fedigan, 8 is Susan and Jeanne';


--
-- Name: COLUMN studyinfo.commonname; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.studyinfo.commonname IS 'Species common name. Use whatever you want.';


--
-- Name: COLUMN studyinfo.sciname; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.studyinfo.sciname IS 'Species scientific name. Use whatever you want.';


--
-- Name: COLUMN studyinfo.siteid; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.studyinfo.siteid IS 'Site location. Amboseli, Gombe, Caratinga, Karisoke, etc.';


--
-- Name: COLUMN studyinfo.owners; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.studyinfo.owners IS 'Data ownership. JGI, DFGF, Karen Strier, Altmann & Alberts, etc.';


--
-- Name: COLUMN studyinfo.latitude; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.studyinfo.latitude IS 'Latitude. Universal Transverse Mercator.';


--
-- Name: COLUMN studyinfo.longitude; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON COLUMN public.studyinfo.longitude IS 'Longitude. Universal Transverse Mercator.';


--
-- Name: dmltrace dmltrace_oid; Type: DEFAULT; Schema: audit; Owner: plhdb_admin
--

ALTER TABLE ONLY audit.dmltrace ALTER COLUMN dmltrace_oid SET DEFAULT nextval('audit.dmltrace_dmltrace_oid_seq'::regclass);


--
-- Name: account user_oid; Type: DEFAULT; Schema: auth; Owner: plhdb_admin
--

ALTER TABLE ONLY auth.account ALTER COLUMN user_oid SET DEFAULT nextval('auth.account_user_oid_seq'::regclass);


--
-- Name: permission permission_oid; Type: DEFAULT; Schema: auth; Owner: plhdb_admin
--

ALTER TABLE ONLY auth.permission ALTER COLUMN permission_oid SET DEFAULT nextval('auth.permission_permission_oid_seq'::regclass);


--
-- Name: cvterm cvterm_oid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm ALTER COLUMN cvterm_oid SET DEFAULT nextval('plhdb.cvterm_cvterm_oid_seq'::regclass);


--
-- Name: cvterm_relationship cvterm_relationship_oid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm_relationship ALTER COLUMN cvterm_relationship_oid SET DEFAULT nextval('plhdb.cvterm_relationship_cvterm_relationship_oid_seq'::regclass);


--
-- Name: individual individual_oid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual ALTER COLUMN individual_oid SET DEFAULT nextval('plhdb.individual_individual_oid_seq'::regclass);


--
-- Name: individual_relationship individual_relationship_oid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual_relationship ALTER COLUMN individual_relationship_oid SET DEFAULT nextval('plhdb.individual_relationship_individual_relationship_oid_seq'::regclass);


--
-- Name: observation observation_oid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.observation ALTER COLUMN observation_oid SET DEFAULT nextval('plhdb.observation_observation_oid_seq'::regclass);


--
-- Name: recordingperiod recordingperiod_oid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.recordingperiod ALTER COLUMN recordingperiod_oid SET DEFAULT nextval('plhdb.recordingperiod_recordingperiod_oid_seq'::regclass);


--
-- Name: site site_oid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.site ALTER COLUMN site_oid SET DEFAULT nextval('plhdb.site_site_oid_seq'::regclass);


--
-- Name: study study_oid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.study ALTER COLUMN study_oid SET DEFAULT nextval('plhdb.study_study_oid_seq'::regclass);


--
-- Name: taxon taxon_oid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.taxon ALTER COLUMN taxon_oid SET DEFAULT nextval('plhdb.taxon_taxon_oid_seq'::regclass);


--
-- Name: dmltrace dmltrace_c1; Type: CONSTRAINT; Schema: audit; Owner: plhdb_admin
--

ALTER TABLE ONLY audit.dmltrace
    ADD CONSTRAINT dmltrace_c1 UNIQUE (rowkey, tablename, optype, usr, tstamp);


--
-- Name: dmltrace dmltrace_pkey; Type: CONSTRAINT; Schema: audit; Owner: plhdb_admin
--

ALTER TABLE ONLY audit.dmltrace
    ADD CONSTRAINT dmltrace_pkey PRIMARY KEY (dmltrace_oid);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: auth; Owner: plhdb_admin
--

ALTER TABLE ONLY auth.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (user_oid);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: auth; Owner: plhdb_admin
--

ALTER TABLE ONLY auth.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (permission_oid);


--
-- Name: cvterm cvterm_identifier; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm
    ADD CONSTRAINT cvterm_identifier UNIQUE (identifier);


--
-- Name: cvterm cvterm_name; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm
    ADD CONSTRAINT cvterm_name UNIQUE (name, namespace);


--
-- Name: cvterm cvterm_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm
    ADD CONSTRAINT cvterm_pkey PRIMARY KEY (cvterm_oid);


--
-- Name: cvterm_relationship cvterm_relationship_c1; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm_relationship
    ADD CONSTRAINT cvterm_relationship_c1 UNIQUE (subject_oid, object_oid);


--
-- Name: cvterm_relationship cvterm_relationship_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm_relationship
    ADD CONSTRAINT cvterm_relationship_pkey PRIMARY KEY (cvterm_relationship_oid);


--
-- Name: individual individual_oid_code; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual
    ADD CONSTRAINT individual_oid_code UNIQUE (id, study_oid);


--
-- Name: individual individual_oid_name; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual
    ADD CONSTRAINT individual_oid_name UNIQUE (name, study_oid);


--
-- Name: individual individual_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual
    ADD CONSTRAINT individual_pkey PRIMARY KEY (individual_oid);


--
-- Name: individual_relationship individual_relationship_c1; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual_relationship
    ADD CONSTRAINT individual_relationship_c1 UNIQUE (parent_oid, child_oid);


--
-- Name: individual_relationship individual_relationship_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual_relationship
    ADD CONSTRAINT individual_relationship_pkey PRIMARY KEY (individual_relationship_oid);


--
-- Name: observation observation_c1; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.observation
    ADD CONSTRAINT observation_c1 UNIQUE (time_of_observation, individual_oid, type_oid);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_oid);


--
-- Name: recordingperiod recordingperiod_c1; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.recordingperiod
    ADD CONSTRAINT recordingperiod_c1 UNIQUE (start_oid, end_oid, type_oid);


--
-- Name: recordingperiod recordingperiod_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.recordingperiod
    ADD CONSTRAINT recordingperiod_pkey PRIMARY KEY (recordingperiod_oid);


--
-- Name: site site_name; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.site
    ADD CONSTRAINT site_name UNIQUE (name);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (site_oid);


--
-- Name: study study_code; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.study
    ADD CONSTRAINT study_code UNIQUE (id);


--
-- Name: study study_name; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.study
    ADD CONSTRAINT study_name UNIQUE (name);


--
-- Name: study study_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.study
    ADD CONSTRAINT study_pkey PRIMARY KEY (study_oid);


--
-- Name: taxon taxon_common_name; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.taxon
    ADD CONSTRAINT taxon_common_name UNIQUE (common_name);


--
-- Name: taxon taxon_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.taxon
    ADD CONSTRAINT taxon_pkey PRIMARY KEY (taxon_oid);


--
-- Name: taxon taxon_scientific_name; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.taxon
    ADD CONSTRAINT taxon_scientific_name UNIQUE (scientific_name);


--
-- Name: cvterm_code; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX cvterm_code ON plhdb.cvterm USING btree (code);


--
-- Name: cvterm_relationship_object; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX cvterm_relationship_object ON plhdb.cvterm_relationship USING btree (object_oid);


--
-- Name: individual_relationship_child; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX individual_relationship_child ON plhdb.individual_relationship USING btree (child_oid);


--
-- Name: observation_individual; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX observation_individual ON plhdb.observation USING btree (individual_oid);


--
-- Name: recordingperiod_end; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX recordingperiod_end ON plhdb.recordingperiod USING btree (end_oid);


--
-- Name: cvterm_relationships r_cvterm_relationships_del; Type: RULE; Schema: plhdb; Owner: plhdb_admin
--

CREATE RULE r_cvterm_relationships_del AS
    ON DELETE TO plhdb.cvterm_relationships DO INSTEAD  DELETE FROM plhdb.cvterm_relationship
  WHERE ((cvterm_relationship.subject_oid = old.subj_oid) AND (cvterm_relationship.object_oid = old.obj_oid));


--
-- Name: cvterm_relationships r_cvterm_relationships_ins; Type: RULE; Schema: plhdb; Owner: plhdb_admin
--

CREATE RULE r_cvterm_relationships_ins AS
    ON INSERT TO plhdb.cvterm_relationships DO INSTEAD  INSERT INTO plhdb.cvterm_relationship (subject_oid, predicate_oid, object_oid)
  VALUES (plhdb.get_cvterm_oid(new.subj_oid, new.subj_name, new.subj_code, new.subj_identifier, new.subj_namespace, NULL::character varying, 1), plhdb.get_cvterm_oid(new.pred_oid, new.pred_name, new.pred_code, new.pred_identifier, new.pred_namespace, NULL::character varying, 1), plhdb.get_cvterm_oid(new.obj_oid, new.obj_name, new.obj_code, new.obj_identifier, new.obj_namespace, NULL::character varying, 1));


--
-- Name: cvterm_relationships r_cvterm_relationships_upd; Type: RULE; Schema: plhdb; Owner: plhdb_admin
--

CREATE RULE r_cvterm_relationships_upd AS
    ON UPDATE TO plhdb.cvterm_relationships DO INSTEAD  UPDATE plhdb.cvterm_relationship SET subject_oid = plhdb.get_cvterm_oid(new.subj_oid, new.subj_name, new.subj_code, new.subj_identifier, new.subj_namespace, NULL::character varying, 3), predicate_oid = plhdb.get_cvterm_oid(new.pred_oid, new.pred_name, new.pred_code, new.pred_identifier, new.pred_namespace, NULL::character varying, 3), object_oid = plhdb.get_cvterm_oid(new.obj_oid, new.obj_name, new.obj_code, new.obj_identifier, new.obj_namespace, NULL::character varying, 3)
  WHERE ((cvterm_relationship.subject_oid = old.subj_oid) AND (cvterm_relationship.object_oid = old.obj_oid));


--
-- Name: biography r_biography_del; Type: RULE; Schema: public; Owner: plhdb_admin
--

CREATE RULE r_biography_del AS
    ON DELETE TO public.biography DO INSTEAD  DELETE FROM plhdb.individual
  WHERE (((individual.id)::text = (old.animid)::text) AND (individual.study_oid = ( SELECT study.study_oid
           FROM plhdb.study
          WHERE ((study.id)::text = (old.studyid)::text))));


--
-- Name: biography r_biography_ins; Type: RULE; Schema: public; Owner: plhdb_admin
--

CREATE RULE r_biography_ins AS
    ON INSERT TO public.biography DO INSTEAD ( SELECT public.ins_biography_assocs(new.studyid, new.animid, new.animname, new.birthgroup, new.bgqual, new.sex, new.momid, new.firstborn, new.birthdate, new.bdmin, new.bdmax, new.bddist, new.entrydate, new.entrytype, new.departdate, new.departdateerror, new.departtype) AS ins_biography_assocs;
 INSERT INTO audit.dmltrace (tablename, rowkey, optype, usr, tstamp)
  VALUES ('Biography'::character varying, (((new.studyid)::text || '-'::text) || (new.animid)::text), 'I'::bpchar, "current_user"(), now());
);


--
-- Name: biography r_biography_upd; Type: RULE; Schema: public; Owner: plhdb_admin
--

CREATE RULE r_biography_upd AS
    ON UPDATE TO public.biography DO INSTEAD ( INSERT INTO audit.dmltrace (tablename, rowkey, optype, usr)
  VALUES ('Biography'::character varying, old.anim_oid, 'U'::bpchar, "current_user"());
 SELECT public.upd_biography_assocs(new.studyid, new.animid, new.animname, new.birthgroup, new.bgqual, new.sex, new.momid, new.firstborn, new.birthdate, new.bdmin, new.bdmax, new.bddist, new.entrydate, new.entrytype, new.departdate, new.departdateerror, new.departtype, old.studyid, old.animid, old.momid, old.birthdate, old.entrydate, old.entrytype, old.departdate, old.departtype) AS upd_biography_assocs;
 UPDATE audit.dmltrace SET tstamp = (timeofday())::timestamp without time zone
  WHERE (((dmltrace.tablename)::text = 'Biography'::text) AND ((dmltrace.rowkey)::text = (old.anim_oid)::text) AND (dmltrace.optype = 'U'::bpchar) AND ((dmltrace.usr)::name = "current_user"()) AND (dmltrace.tstamp IS NULL));
);


--
-- Name: femalefertilityinterval r_femalefertilityinterval_del; Type: RULE; Schema: public; Owner: plhdb_admin
--

CREATE RULE r_femalefertilityinterval_del AS
    ON DELETE TO public.femalefertilityinterval DO INSTEAD  DELETE FROM plhdb.recordingperiod
  WHERE ((recordingperiod.start_oid = ( SELECT observation.observation_oid
           FROM plhdb.observation
          WHERE ((observation.time_of_observation = old.startdate) AND (observation.type_oid = plhdb.get_cvterm_oid(NULL::character varying, old.starttype, NULL::character varying, 'event types'::character varying, 'start of recording'::character varying, 0)) AND (observation.individual_oid = old.anim_oid)))) AND (COALESCE(recordingperiod.end_oid, '-1'::integer) =
        CASE
            WHEN (old.stopdate IS NULL) THEN '-1'::integer
            ELSE ( SELECT observation.observation_oid
               FROM plhdb.observation
              WHERE ((observation.time_of_observation = old.stopdate) AND (observation.type_oid = plhdb.get_cvterm_oid(NULL::character varying, old.stoptype, NULL::character varying, 'event types'::character varying, 'end of recording'::character varying, 0)) AND (observation.individual_oid = old.anim_oid)))
        END) AND (recordingperiod.type_oid = ( SELECT cvterm.cvterm_oid
           FROM plhdb.cvterm
          WHERE (((cvterm.name)::text = 'female fertility period'::text) AND ((cvterm.namespace)::text = 'period types'::text)))));


--
-- Name: femalefertilityinterval r_femalefertilityinterval_ins; Type: RULE; Schema: public; Owner: plhdb_admin
--

CREATE RULE r_femalefertilityinterval_ins AS
    ON INSERT TO public.femalefertilityinterval DO INSTEAD ( INSERT INTO plhdb.recordingperiod (start_oid, end_oid, type_oid)
  VALUES (plhdb.get_observation_oid(new.startdate, NULL::double precision, plhdb.get_cvterm_oid(NULL::character varying, new.starttype, NULL::character varying, 'event types'::character varying, 'start of recording'::character varying, 0),
        CASE
            WHEN (new.anim_oid IS NULL) THEN plhdb.get_individual_oid(new.animid, NULL::integer, new.studyid, 0)
            ELSE new.anim_oid
        END, 1),
        CASE
            WHEN (new.stopdate IS NULL) THEN NULL::integer
            ELSE plhdb.get_observation_oid(new.stopdate, NULL::double precision, plhdb.get_cvterm_oid(NULL::character varying, new.stoptype, NULL::character varying, 'event types'::character varying, 'end of recording'::character varying, 0),
            CASE
                WHEN (new.anim_oid IS NULL) THEN plhdb.get_individual_oid(new.animid, NULL::integer, new.studyid, 0)
                ELSE new.anim_oid
            END, 1)
        END, plhdb.get_cvterm_oid('female fertility period'::character varying, NULL::character varying, NULL::character varying, 'period types'::character varying, NULL::character varying, 0));
 INSERT INTO audit.dmltrace (tablename, rowkey, optype, usr, tstamp)
  VALUES ('FemaleFertiliyInterval'::character varying, (((((new.animid)::text || '-'::text) || (COALESCE(new.studyid, '?'::character varying))::text) || '-'::text) || to_char(new.startdate, 'YYYY-mm-dd'::text)), 'I'::bpchar, "current_user"(), now());
);


--
-- Name: femalefertilityinterval r_femalefertilityinterval_upd; Type: RULE; Schema: public; Owner: plhdb_admin
--

CREATE RULE r_femalefertilityinterval_upd AS
    ON UPDATE TO public.femalefertilityinterval DO INSTEAD ( INSERT INTO audit.dmltrace (tablename, rowkey, optype, usr)
  VALUES ('FemaleFertilityInterval'::character varying, old.interval_oid, 'U'::bpchar, "current_user"());
 SELECT public.upd_plhdb_recordingperiod(
        CASE
            WHEN (((new.animid)::text <> (old.animid)::text) OR ((new.studyid)::text <> (old.studyid)::text)) THEN plhdb.get_individual_oid(new.animid, NULL::integer, new.studyid, 0)
            ELSE new.anim_oid
        END, new.startdate, ('-1'::integer)::double precision, new.starttype, new.stopdate, ('-1'::integer)::double precision, new.stoptype, 'female fertility period'::character varying, old.anim_oid, old.startdate, old.starttype, old.stopdate, old.stoptype) AS upd_plhdb_recordingperiod;
 UPDATE audit.dmltrace SET tstamp = (timeofday())::timestamp without time zone
  WHERE (((dmltrace.tablename)::text = 'FemaleFertilityInterval'::text) AND ((dmltrace.rowkey)::text = (old.interval_oid)::text) AND (dmltrace.optype = 'U'::bpchar) AND ((dmltrace.usr)::name = "current_user"()) AND (dmltrace.tstamp IS NULL));
);


--
-- Name: studyinfo r_studyinfo_del; Type: RULE; Schema: public; Owner: plhdb_admin
--

CREATE RULE r_studyinfo_del AS
    ON DELETE TO public.studyinfo DO INSTEAD  DELETE FROM plhdb.study
  WHERE ((study.id)::text = (old.studyid)::text);


--
-- Name: RULE r_studyinfo_del ON studyinfo; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON RULE r_studyinfo_del ON public.studyinfo IS 'Rule that takes the role of an INSTEAD DELTE trigger on the PLHDB API view studyinfo. It allows deleting rows from the view. The effect of deleting a row from the view is deleting rows from the study table.';


--
-- Name: studyinfo r_studyinfo_ins; Type: RULE; Schema: public; Owner: plhdb_admin
--

CREATE RULE r_studyinfo_ins AS
    ON INSERT TO public.studyinfo DO INSTEAD  INSERT INTO plhdb.study (id, owners, taxon_oid, site_oid)
  VALUES (new.studyid, new.owners, plhdb.get_taxon_oid(new.commonname, new.sciname, 1), plhdb.get_site_oid(new.siteid, new.latitude, new.longitude, NULL::character varying, 1));


--
-- Name: RULE r_studyinfo_ins ON studyinfo; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON RULE r_studyinfo_ins ON public.studyinfo IS 'Rule that takes the role of an INSTEAD INSERT trigger on the PLHDB API view studyinfo. It allows inserts into the view. Taxon and site are looked up first, and will only be inserted as new if they are not found.';


--
-- Name: studyinfo r_studyinfo_upd; Type: RULE; Schema: public; Owner: plhdb_admin
--

CREATE RULE r_studyinfo_upd AS
    ON UPDATE TO public.studyinfo DO INSTEAD  UPDATE plhdb.study SET id = new.studyid, owners = new.owners, taxon_oid = plhdb.get_taxon_oid(new.commonname, new.sciname, 3), site_oid = plhdb.get_site_oid(new.siteid, new.latitude, new.longitude, NULL::character varying, 3)
  WHERE ((study.id)::text = (old.studyid)::text);


--
-- Name: RULE r_studyinfo_upd ON studyinfo; Type: COMMENT; Schema: public; Owner: plhdb_admin
--

COMMENT ON RULE r_studyinfo_upd ON public.studyinfo IS 'Rule that takes the role of an INSTEAD UPDATE trigger on the PLHDB API view studyinfo. It allows updates to the view. The implementation supports changing to a new taxon or site, or updating the attributes of an existing taxon or site. A taxon is first looked up by SciName, then by CommonName; if it is found, CommonName and SciName will be updated. Otherwise, a new taxon is created with the specified values.';


--
-- Name: biography_imp biography_ins_tr; Type: TRIGGER; Schema: bulkimp; Owner: plhdb_admin
--

CREATE TRIGGER biography_ins_tr BEFORE INSERT ON bulkimp.biography_imp FOR EACH ROW EXECUTE FUNCTION bulkimp.biography_ins_trf();


--
-- Name: femalefertilityinterval_imp femalefertilityinterval_ins_tr; Type: TRIGGER; Schema: bulkimp; Owner: plhdb_admin
--

CREATE TRIGGER femalefertilityinterval_ins_tr BEFORE INSERT ON bulkimp.femalefertilityinterval_imp FOR EACH ROW EXECUTE FUNCTION bulkimp.femalefertilityinterval_ins_trf();


--
-- Name: studyinfo_imp studyinfo_ins_tr; Type: TRIGGER; Schema: bulkimp; Owner: plhdb_admin
--

CREATE TRIGGER studyinfo_ins_tr BEFORE INSERT ON bulkimp.studyinfo_imp FOR EACH ROW EXECUTE FUNCTION bulkimp.studyinfo_ins_trf();


--
-- Name: permission permission_user_oid_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: plhdb_admin
--

ALTER TABLE ONLY auth.permission
    ADD CONSTRAINT permission_user_oid_fkey FOREIGN KEY (user_oid) REFERENCES auth.account(user_oid) ON DELETE CASCADE;


--
-- Name: cvterm_relationship cvterm_relationship_object_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm_relationship
    ADD CONSTRAINT cvterm_relationship_object_oid_fkey FOREIGN KEY (object_oid) REFERENCES plhdb.cvterm(cvterm_oid) ON DELETE CASCADE;


--
-- Name: cvterm_relationship cvterm_relationship_predicate_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm_relationship
    ADD CONSTRAINT cvterm_relationship_predicate_oid_fkey FOREIGN KEY (predicate_oid) REFERENCES plhdb.cvterm(cvterm_oid) ON DELETE CASCADE;


--
-- Name: cvterm_relationship cvterm_relationship_subject_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.cvterm_relationship
    ADD CONSTRAINT cvterm_relationship_subject_oid_fkey FOREIGN KEY (subject_oid) REFERENCES plhdb.cvterm(cvterm_oid) ON DELETE CASCADE;


--
-- Name: individual_relationship individual_relationship_child_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual_relationship
    ADD CONSTRAINT individual_relationship_child_oid_fkey FOREIGN KEY (child_oid) REFERENCES plhdb.individual(individual_oid) ON DELETE CASCADE;


--
-- Name: individual_relationship individual_relationship_parent_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual_relationship
    ADD CONSTRAINT individual_relationship_parent_oid_fkey FOREIGN KEY (parent_oid) REFERENCES plhdb.individual(individual_oid) ON DELETE CASCADE;


--
-- Name: individual individual_study_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.individual
    ADD CONSTRAINT individual_study_oid_fkey FOREIGN KEY (study_oid) REFERENCES plhdb.study(study_oid);


--
-- Name: observation observation_individual_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.observation
    ADD CONSTRAINT observation_individual_oid_fkey FOREIGN KEY (individual_oid) REFERENCES plhdb.individual(individual_oid) ON DELETE CASCADE;


--
-- Name: observation observation_prob_type_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.observation
    ADD CONSTRAINT observation_prob_type_oid_fkey FOREIGN KEY (prob_type_oid) REFERENCES plhdb.cvterm(cvterm_oid) ON DELETE SET NULL;


--
-- Name: observation observation_type_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.observation
    ADD CONSTRAINT observation_type_oid_fkey FOREIGN KEY (type_oid) REFERENCES plhdb.cvterm(cvterm_oid);


--
-- Name: recordingperiod recordingperiod_end_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.recordingperiod
    ADD CONSTRAINT recordingperiod_end_oid_fkey FOREIGN KEY (end_oid) REFERENCES plhdb.observation(observation_oid) ON DELETE SET NULL;


--
-- Name: recordingperiod recordingperiod_start_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.recordingperiod
    ADD CONSTRAINT recordingperiod_start_oid_fkey FOREIGN KEY (start_oid) REFERENCES plhdb.observation(observation_oid) ON DELETE CASCADE;


--
-- Name: recordingperiod recordingperiod_type_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.recordingperiod
    ADD CONSTRAINT recordingperiod_type_oid_fkey FOREIGN KEY (type_oid) REFERENCES plhdb.cvterm(cvterm_oid);


--
-- Name: study study_site_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.study
    ADD CONSTRAINT study_site_oid_fkey FOREIGN KEY (site_oid) REFERENCES plhdb.site(site_oid) ON DELETE CASCADE;


--
-- Name: study study_taxon_oid_fkey; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.study
    ADD CONSTRAINT study_taxon_oid_fkey FOREIGN KEY (taxon_oid) REFERENCES plhdb.taxon(taxon_oid) ON DELETE CASCADE;


--
-- Name: SCHEMA audit; Type: ACL; Schema: -; Owner: plhdb_admin
--

GRANT USAGE ON SCHEMA audit TO plhdb_managers;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: plhdb_admin
--

GRANT USAGE ON SCHEMA auth TO plhdb_managers;


--
-- Name: SCHEMA bulkimp; Type: ACL; Schema: -; Owner: plhdb_admin
--

GRANT USAGE ON SCHEMA bulkimp TO plhdb_managers;


--
-- Name: SCHEMA plhdb; Type: ACL; Schema: -; Owner: plhdb_admin
--

GRANT USAGE ON SCHEMA plhdb TO plhdb_managers;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO plhdb_managers;


--
-- Name: TABLE dmltrace; Type: ACL; Schema: audit; Owner: plhdb_admin
--

GRANT SELECT ON TABLE audit.dmltrace TO plhdb_managers;


--
-- Name: TABLE account; Type: ACL; Schema: auth; Owner: plhdb_admin
--

GRANT SELECT ON TABLE auth.account TO plhdb_managers;


--
-- Name: TABLE permission; Type: ACL; Schema: auth; Owner: plhdb_admin
--

GRANT SELECT ON TABLE auth.permission TO plhdb_managers;


--
-- Name: TABLE biography_imp; Type: ACL; Schema: bulkimp; Owner: plhdb_admin
--

GRANT SELECT ON TABLE bulkimp.biography_imp TO plhdb_managers;


--
-- Name: TABLE femalefertilityinterval_imp; Type: ACL; Schema: bulkimp; Owner: plhdb_admin
--

GRANT SELECT ON TABLE bulkimp.femalefertilityinterval_imp TO plhdb_managers;


--
-- Name: TABLE studyinfo_imp; Type: ACL; Schema: bulkimp; Owner: plhdb_admin
--

GRANT SELECT ON TABLE bulkimp.studyinfo_imp TO plhdb_managers;


--
-- Name: TABLE cvterm; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.cvterm TO plhdb_managers;


--
-- Name: TABLE cvterm_relationship; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.cvterm_relationship TO plhdb_managers;


--
-- Name: TABLE cvterm_relationships; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.cvterm_relationships TO plhdb_managers;


--
-- Name: TABLE individual; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.individual TO plhdb_managers;


--
-- Name: TABLE individual_relationship; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.individual_relationship TO plhdb_managers;


--
-- Name: TABLE study; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.study TO plhdb_managers;


--
-- Name: TABLE individual_relationships; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.individual_relationships TO plhdb_managers;


--
-- Name: TABLE observation; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.observation TO plhdb_managers;


--
-- Name: TABLE observations; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.observations TO plhdb_managers;


--
-- Name: TABLE recordingperiod; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.recordingperiod TO plhdb_managers;


--
-- Name: TABLE recordingperiods; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.recordingperiods TO plhdb_managers;


--
-- Name: TABLE site; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.site TO plhdb_managers;


--
-- Name: TABLE taxon; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT ON TABLE plhdb.taxon TO plhdb_managers;


--
-- Name: TABLE biography; Type: ACL; Schema: public; Owner: plhdb_admin
--

GRANT SELECT ON TABLE public.biography TO plhdb_managers;


--
-- Name: TABLE femalefertilityinterval; Type: ACL; Schema: public; Owner: plhdb_admin
--

GRANT SELECT ON TABLE public.femalefertilityinterval TO plhdb_managers;


--
-- Name: TABLE studyinfo; Type: ACL; Schema: public; Owner: plhdb_admin
--

GRANT SELECT ON TABLE public.studyinfo TO plhdb_managers;

