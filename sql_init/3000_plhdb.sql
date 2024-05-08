--
-- Database "plhdb" dump
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
-- Name: plhdb; Type: DATABASE; Schema: -; Owner: plhdb_admin
--

CREATE DATABASE plhdb WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LOCALE = 'C';


ALTER DATABASE plhdb OWNER TO plhdb_admin;

\connect plhdb

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
-- Name: DATABASE plhdb; Type: COMMENT; Schema: -; Owner: plhdb_admin
--

COMMENT ON DATABASE plhdb IS 'Production database of the PLHDB group.';


--
-- Name: plhdb; Type: DATABASE PROPERTIES; Schema: -; Owner: plhdb_admin
--

ALTER DATABASE plhdb SET "DateStyle" TO 'MDY';
ALTER DATABASE plhdb SET "TimeZone" TO 'US/Eastern';
ALTER DATABASE plhdb SET search_path TO 'plhdb', 'sandbox', '$user';


\connect plhdb

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

-- --
-- -- Name: alberts; Type: SCHEMA; Schema: -; Owner: alberts
-- --

-- CREATE SCHEMA alberts;


-- ALTER SCHEMA alberts OWNER TO alberts;

-- --
-- -- Name: SCHEMA alberts; Type: COMMENT; Schema: -; Owner: alberts
-- --

-- COMMENT ON SCHEMA alberts IS 'Area for the exclusive use of Susan Alberts (Manager account)';


-- --
-- -- Name: amb208; Type: SCHEMA; Schema: -; Owner: amb208
-- --

-- CREATE SCHEMA amb208;


-- ALTER SCHEMA amb208 OWNER TO amb208;

-- --
-- -- Name: SCHEMA amb208; Type: COMMENT; Schema: -; Owner: amb208
-- --

-- COMMENT ON SCHEMA amb208 IS 'Area for the exclusive use of Anne Bronikowski';


-- --
-- -- Name: ap178; Type: SCHEMA; Schema: -; Owner: ap178
-- --

-- CREATE SCHEMA ap178;


-- ALTER SCHEMA ap178 OWNER TO ap178;

-- --
-- -- Name: SCHEMA ap178; Type: COMMENT; Schema: -; Owner: ap178
-- --

-- COMMENT ON SCHEMA ap178 IS 'Area for the exclusive use of Anne Pusey';


-- --
-- -- Name: brockman; Type: SCHEMA; Schema: -; Owner: brockman
-- --

-- CREATE SCHEMA brockman;


-- ALTER SCHEMA brockman OWNER TO brockman;

-- --
-- -- Name: SCHEMA brockman; Type: COMMENT; Schema: -; Owner: brockman
-- --

-- COMMENT ON SCHEMA brockman IS 'Area for the exclusive use of Diane Brockman';


-- --
-- -- Name: colchero; Type: SCHEMA; Schema: -; Owner: colchero
-- --

-- CREATE SCHEMA colchero;


-- ALTER SCHEMA colchero OWNER TO colchero;

-- --
-- -- Name: SCHEMA colchero; Type: COMMENT; Schema: -; Owner: colchero
-- --

-- COMMENT ON SCHEMA colchero IS 'Area for the exclusive use of Fernando Colchero';


-- --
-- -- Name: evl6; Type: SCHEMA; Schema: -; Owner: evl6
-- --

-- CREATE SCHEMA evl6;


-- ALTER SCHEMA evl6 OWNER TO evl6;

-- --
-- -- Name: SCHEMA evl6; Type: COMMENT; Schema: -; Owner: evl6
-- --

-- COMMENT ON SCHEMA evl6 IS 'Area for the exclusive use of Elizabeth Lonsdorf';


-- --
-- -- Name: fac13; Type: SCHEMA; Schema: -; Owner: fac13
-- --

-- CREATE SCHEMA fac13;


-- ALTER SCHEMA fac13 OWNER TO fac13;

-- --
-- -- Name: SCHEMA fac13; Type: COMMENT; Schema: -; Owner: fac13
-- --

-- COMMENT ON SCHEMA fac13 IS 'Area for the exclusive use of Fernando Campos';


-- --
-- -- Name: ja253; Type: SCHEMA; Schema: -; Owner: ja253
-- --

-- CREATE SCHEMA ja253;


-- ALTER SCHEMA ja253 OWNER TO ja253;

-- --
-- -- Name: SCHEMA ja253; Type: COMMENT; Schema: -; Owner: ja253
-- --

-- COMMENT ON SCHEMA ja253 IS 'Area for the exclusive use of Jeanne Altmann';


-- --
-- -- Name: jba22; Type: SCHEMA; Schema: -; Owner: jba22
-- --

-- CREATE SCHEMA jba22;


-- ALTER SCHEMA jba22 OWNER TO jba22;

-- --
-- -- Name: SCHEMA jba22; Type: COMMENT; Schema: -; Owner: jba22
-- --

-- COMMENT ON SCHEMA jba22 IS 'Area for the exclusive use of Jason Altekruse, Strier Lab';


-- --
-- -- Name: jgordon; Type: SCHEMA; Schema: -; Owner: jgordon
-- --

-- CREATE SCHEMA jgordon;


-- ALTER SCHEMA jgordon OWNER TO jgordon;

-- --
-- -- Name: SCHEMA jgordon; Type: COMMENT; Schema: -; Owner: jgordon
-- --

-- COMMENT ON SCHEMA jgordon IS 'Area for the exclusive use of Jake Gordon (Manager account)';


-- --
-- -- Name: kbs28; Type: SCHEMA; Schema: -; Owner: kbs28
-- --

-- CREATE SCHEMA kbs28;


-- ALTER SCHEMA kbs28 OWNER TO kbs28;

-- --
-- -- Name: SCHEMA kbs28; Type: COMMENT; Schema: -; Owner: kbs28
-- --

-- COMMENT ON SCHEMA kbs28 IS 'Area for the exclusive use of Karen Strier (Manager account)';


-- --
-- -- Name: kop; Type: SCHEMA; Schema: -; Owner: kop
-- --

-- CREATE SCHEMA kop;


-- ALTER SCHEMA kop OWNER TO kop;

-- --
-- -- Name: SCHEMA kop; Type: COMMENT; Schema: -; Owner: kop
-- --

-- COMMENT ON SCHEMA kop IS 'Area for the exclusive use of Karl O. Pinc <kop@meme.com>';


-- --
-- -- Name: kop_manager; Type: SCHEMA; Schema: -; Owner: kop_manager
-- --

-- CREATE SCHEMA kop_manager;


-- ALTER SCHEMA kop_manager OWNER TO kop_manager;

-- --
-- -- Name: SCHEMA kop_manager; Type: COMMENT; Schema: -; Owner: kop_manager
-- --

-- COMMENT ON SCHEMA kop_manager IS 'Area for the exclusive use of Karl O. Pinc <kop@meme.com>';


-- --
-- -- Name: ks163; Type: SCHEMA; Schema: -; Owner: ks163
-- --

-- CREATE SCHEMA ks163;


-- ALTER SCHEMA ks163 OWNER TO ks163;

-- --
-- -- Name: SCHEMA ks163; Type: COMMENT; Schema: -; Owner: ks163
-- --

-- COMMENT ON SCHEMA ks163 IS 'Area for the exclusive use of Kara Walker (data manager for Anne Pusey';


-- --
-- -- Name: lmf41; Type: SCHEMA; Schema: -; Owner: lmf41
-- --

-- CREATE SCHEMA lmf41;


-- ALTER SCHEMA lmf41 OWNER TO lmf41;

-- --
-- -- Name: SCHEMA lmf41; Type: COMMENT; Schema: -; Owner: lmf41
-- --

-- COMMENT ON SCHEMA lmf41 IS 'Area for the exclusive use of Linda Fedigan';


-- --
-- -- Name: mc531; Type: SCHEMA; Schema: -; Owner: mc531
-- --

-- CREATE SCHEMA mc531;


-- ALTER SCHEMA mc531 OWNER TO mc531;

-- --
-- -- Name: SCHEMA mc531; Type: COMMENT; Schema: -; Owner: mc531
-- --

-- COMMENT ON SCHEMA mc531 IS 'Area for the exclusive use of Marina Cords';


-- --
-- -- Name: mez9; Type: SCHEMA; Schema: -; Owner: mez9
-- --

-- CREATE SCHEMA mez9;


-- ALTER SCHEMA mez9 OWNER TO mez9;

-- --
-- -- Name: SCHEMA mez9; Type: COMMENT; Schema: -; Owner: mez9
-- --

-- COMMENT ON SCHEMA mez9 IS 'Area for the exclusive use of Matthew Zipple';


--
-- Name: plhdb; Type: SCHEMA; Schema: -; Owner: plhdb_admin
--

CREATE SCHEMA plhdb;


ALTER SCHEMA plhdb OWNER TO plhdb_admin;

--
-- Name: SCHEMA plhdb; Type: COMMENT; Schema: -; Owner: plhdb_admin
--

COMMENT ON SCHEMA plhdb IS 'Official PLHDB tables, views, etc.';


-- --
-- -- Name: rmw60; Type: SCHEMA; Schema: -; Owner: rmw60
-- --

-- CREATE SCHEMA rmw60;


-- ALTER SCHEMA rmw60 OWNER TO rmw60;

-- --
-- -- Name: SCHEMA rmw60; Type: COMMENT; Schema: -; Owner: rmw60
-- --

-- COMMENT ON SCHEMA rmw60 IS 'Area for the exclusive use of Roman Wittig, wittig@eva.mpg.de';


-- --
-- -- Name: rrl8; Type: SCHEMA; Schema: -; Owner: rrl8
-- --

-- CREATE SCHEMA rrl8;


-- ALTER SCHEMA rrl8 OWNER TO rrl8;

-- --
-- -- Name: SCHEMA rrl8; Type: COMMENT; Schema: -; Owner: rrl8
-- --

-- COMMENT ON SCHEMA rrl8 IS 'Area for the exclusive use of Rich Lawler';


--
-- Name: sandbox; Type: SCHEMA; Schema: -; Owner: plhdb_admin
--

CREATE SCHEMA sandbox;


ALTER SCHEMA sandbox OWNER TO plhdb_admin;

--
-- Name: SCHEMA sandbox; Type: COMMENT; Schema: -; Owner: plhdb_admin
--

COMMENT ON SCHEMA sandbox IS 'Shared area for plhdb working group to experiment with new tables, etc.; database objects shared amongst group members in the same fashion as those database objects in the "plhdb" schema.';


-- --
-- -- Name: sep67; Type: SCHEMA; Schema: -; Owner: sep67
-- --

-- CREATE SCHEMA sep67;


-- ALTER SCHEMA sep67 OWNER TO sep67;

-- --
-- -- Name: SCHEMA sep67; Type: COMMENT; Schema: -; Owner: sep67
-- --

-- COMMENT ON SCHEMA sep67 IS 'Area for the exclusive use of Susan Perry';


-- --
-- -- Name: slm109; Type: SCHEMA; Schema: -; Owner: slm109
-- --

-- CREATE SCHEMA slm109;


-- ALTER SCHEMA slm109 OWNER TO slm109;

-- --
-- -- Name: SCHEMA slm109; Type: COMMENT; Schema: -; Owner: slm109
-- --

-- COMMENT ON SCHEMA slm109 IS 'Area for the exclusive use of Sergio Mendes (collaborator with Karen Strier)';


-- --
-- -- Name: tss30; Type: SCHEMA; Schema: -; Owner: tss30
-- --

-- CREATE SCHEMA tss30;


-- ALTER SCHEMA tss30 OWNER TO tss30;

-- --
-- -- Name: SCHEMA tss30; Type: COMMENT; Schema: -; Owner: tss30
-- --

-- COMMENT ON SCHEMA tss30 IS 'Area for the exclusive use of Tara Stoinski';


-- --
-- -- Name: wfmorris; Type: SCHEMA; Schema: -; Owner: wfmorris
-- --

-- CREATE SCHEMA wfmorris;


-- ALTER SCHEMA wfmorris OWNER TO wfmorris;

-- --
-- -- Name: SCHEMA wfmorris; Type: COMMENT; Schema: -; Owner: wfmorris
-- --

-- COMMENT ON SCHEMA wfmorris IS 'Area for the exclusive use of Bill Morris';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA plhdb;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: biographies_delete_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.biographies_delete_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- Function for biographies delete trigger
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  DECLARE

  BEGIN

    -- Check PLHDB permissions
    IF NOT(biography_all_access(OLD.studyid)) THEN
      RAISE EXCEPTION insufficient_privilege USING
            MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHIES'
          , DETAIL = 'Key(BId) = (' || OLD.bid
                     || '): Value (StudyId) = (' || OLD.studyid
                     || '): Value (AnimId) = (' || OLD.animid
                     || '): Permission denied to this row'
          , HINT = 'To delete this row, ''all'' level PLHDB permission '
                   || 'to the StudyId is required ';
    END IF;

    -- Delete from the underlying table
    DELETE
      FROM biography
      WHERE biography.bid = OLD.bid;

  RETURN OLD;
  END;
$$;


ALTER FUNCTION plhdb.biographies_delete_func() OWNER TO plhdb_admin;

--
-- Name: biographies_insert_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.biographies_insert_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  DECLARE
    this_mombid biography.mombid%TYPE;

  BEGIN
  -- Function for biographies insert triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  -- Check PLHDB permissions
  IF NOT(biography_insert_access(NEW.studyid)) THEN
    RAISE EXCEPTION insufficient_privilege USING
          MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHIES'
        , DETAIL = 'Key(BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                   || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                   || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                   || '): Permission denied to this row'
        , HINT = 'To insert this row, ''insert'' level PLHDB permission '
                 || 'to the StudyId is required ';
  END IF;

  -- Insert into the underlying table

  IF NEW.momid IS NOT NULL THEN

    IF NEW.mombid IS NOT NULL THEN
      -- Both momid and mombid must refer to the same individual.
      PERFORM 1
        FROM biography
        WHERE biography.bid = NEW.mombid
              AND biography.animid = NEW.momid
              AND biography.studyid = NEW.studyid;
      IF NOT FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHIES'
            , DETAIL = 'Key(BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): Value (MomBId) = (' || CASE WHEN NEW.mombid IS NULL THEN 'NULL' ELSE NEW.mombid::TEXT END

                     || '): Value (MomId) = (' || CASE WHEN NEW.momid IS NULL THEN 'NULL' ELSE NEW.momid::TEXT END

                     || '): The supplied MomBId and MomId values do not '
                     || 'refer to the same individual, or the StudyId '
                     || 'is wrong'
            , HINT = 'The database is case sensitive.  Are upper and lower case characters used appropriately within the data supplied?';
      END IF;
    ELSE  -- Only momid specified
      -- Get the mombid that goes with the supplied momid
      SELECT biography.bid
        INTO this_mombid
        FROM biography
        WHERE biography.studyid = NEW.studyid
              AND biography.animid = NEW.momid;
      IF NOT FOUND THEN
        -- Don't blindly insert a NULL when a momid was specified.
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHIES'
            , DETAIL = 'Key(BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): Value (MomBId) = (' || CASE WHEN NEW.mombid IS NULL THEN 'NULL' ELSE NEW.mombid::TEXT END

                     || '): Value (MomId) = (' || CASE WHEN NEW.momid IS NULL THEN 'NULL' ELSE NEW.momid::TEXT END

                     || '): The supplied MomId and StudyId values do not '
                     || 'refer to an existant individual'
            , HINT = 'The database is case sensitive.  Are upper and lower case characters used appropriately within the data supplied?';
      END IF;

      NEW.mombid := this_mombid;
    END IF;

  ELSE -- No momid specified

    IF NEW.mombid IS NOT NULL THEN
      -- Just in case somebody uses a RETURNING, get the momid
      SELECT biography.animid
        INTO NEW.momid
        FROM biography
        WHERE biography.bid = NEW.mombid;
      -- If we don't find anything the underlying table will raise an erorr
    END IF;
  END IF;

  -- Make sure we have a bid
  IF NEW.bid IS NULL THEN
    SELECT nextval('biography_bid_seq'::REGCLASS)
      INTO NEW.bid;
  END IF;

  -- Insert the underlying biography row
  INSERT INTO biography (
                bid
              , studyid
              , animid
              , animname
              , momonly
              , birthdate
              , bdmin
              , bdmax
              , bddist
              , birthgroup
              , bgqual
              , firstborn
              , mombid
              , sex
              , entrydate
              , entrytype
              , departdate
              , departtype
              , departdateerror)
    VALUES(NEW.bid
         , NEW.studyid
         , NEW.animid
         , NEW.animname
         , NEW.momonly
         , NEW.birthdate
         , NEW.bdmin
         , NEW.bdmax
         , NEW.bddist
         , NEW.birthgroup
         , NEW.bgqual
         , NEW.firstborn
         , NEW.mombid
         , NEW.sex
         , NEW.entrydate
         , NEW.entrytype
         , NEW.departdate
         , NEW.departtype
         , NEW.departdateerror);

  RETURN NEW;
  END;
$$;


ALTER FUNCTION plhdb.biographies_insert_func() OWNER TO plhdb_admin;

--
-- Name: biographies_update_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.biographies_update_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  DECLARE
    this_mombid biography.mombid%TYPE;

  BEGIN
  -- Function for biographies update triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  -- Check PLHDB permissions

  -- Check access to old study.
  IF NOT(biography_edit_access(OLD.studyid)) THEN
    RAISE EXCEPTION insufficient_privilege USING
          MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHIES'
        , DETAIL = 'Key(OLD BId) = (' || OLD.bid
                   || '): Value (OLD StudyId) = (' || OLD.studyid
                   || '): Value (OLD AnimId) = (' || OLD.animid
                   || '): Key(NEW BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                   || '): Value (NEW StudyId) = ('
                   || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                   || '): Value (NEW AnimId) = ('
                   || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                   || '): Permission denied to this row'
        , HINT = 'To update this row, ''edit'' level PLHDB permission '
                 || 'to the old StudyId is required ';
  END IF;

  -- Check access to new study.
  IF NEW.studyid IS NULL
     OR (NEW.studyid <> OLD.studyid
         AND NOT(biography_edit_access(NEW.studyid))) THEN
    RAISE EXCEPTION insufficient_privilege USING
          MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHIES'
        , DETAIL = 'Key(OLD BId) = (' || OLD.bid
                   || '): Value (OLD StudyId) = (' || OLD.studyid
                   || '): Value (OLD AnimId) = (' || OLD.animid
                   || '): Key(NEW BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                   || '): Value (NEW StudyId) = ('
                   || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                   || '): Value (NEW AnimId) = ('
                   || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                   || '): Permission denied to this row'
        , HINT = 'To update this row, ''edit'' level PLHDB permission '
                 || 'to the new StudyId is required ';
  END IF;

  -- Update the underlying table

  -- What is the new mombid?
  -- It is a change in mombid or momid that registers.
  IF NEW.momid IS DISTINCT FROM OLD.momid THEN
    -- momid changed
    IF NEW.mombid IS DISTINCT FROM OLD.mombid THEN
      -- mombid changed also
      -- Are the new mombid and new momid referencing the same row?
      IF NEW.momid IS NOT NULL
         AND NEW.mombid IS NOT NULL THEN
        PERFORM 1
          FROM biography
          WHERE biography.studyid = NEW.studyid
                AND biography.animid = NEW.momid
                AND biography.bid = NEW.mombid;
        IF NOT FOUND THEN
          RAISE EXCEPTION integrity_constraint_violation USING
                MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHIES'
              , DETAIL = 'Key(OLD BId) = (' || OLD.bid
                       || '): Value (OLD StudyId) = (' || OLD.studyid
                       || '): Value (OLD AnimId) = (' || OLD.animid
                       || '): Value (OLD MomBId) = ('
                       || CASE WHEN OLD.mombid IS NULL THEN 'NULL' ELSE OLD.mombid::TEXT END

                       || '): Value (OLD MomId) = ('
                       || CASE WHEN OLD.momid IS NULL THEN 'NULL' ELSE OLD.momid::TEXT END

                       || '): Key(NEW BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                       || '): Value (NEW StudyId) = ('
                       || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                       || '): Value (NEW AnimId) = ('
                       || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                       || '): Value (NEW MomBId) = ('
                       || CASE WHEN NEW.mombid IS NULL THEN 'NULL' ELSE NEW.mombid::TEXT END

                       || '): Value (NEW MomId) = (' || CASE WHEN NEW.momid IS NULL THEN 'NULL' ELSE NEW.momid::TEXT END

                       || '): The supplied new MomBId + new StudyId values '
                       || 'and the supplied new MomId value '
                       || 'do not refer to the same individual'
              , HINT = 'The database is case sensitive.  Are upper and lower case characters used appropriately within the data supplied?';
        END IF;
      END IF;
    ELSE -- mombid did not change
      -- Get the mombid to go with the changed momid
      IF NEW.momid IS NULL THEN
        NEW.mombid := NULL;
      ELSE
        SELECT biography.bid
          INTO this_mombid
          FROM biography
          WHERE biography.studyid = NEW.studyid
                AND biography.animid = NEW.momid;
        IF NOT FOUND THEN
          -- Don't blindly update to NULL when a momid was specified.
          RAISE EXCEPTION integrity_constraint_violation USING
                MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHIES'
              , DETAIL = 'Key(OLD BId) = (' || OLD.bid
                       || '): Value (OLD StudyId) = (' || OLD.studyid
                       || '): Value (OLD AnimId) = (' || OLD.animid
                       || '): Value (OLD MomBId) = ('
                       || CASE WHEN OLD.mombid IS NULL THEN 'NULL' ELSE OLD.mombid::TEXT END

                       || '): Value (OLD MomId) = ('
                       || CASE WHEN OLD.momid IS NULL THEN 'NULL' ELSE OLD.momid::TEXT END

                       || '): Key(NEW BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                       || '): Value (NEW StudyId) = ('
                       || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                       || '): Value (NEW AnimId) = ('
                       || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                       || '): Value (NEW MomBId) = ('
                       || CASE WHEN NEW.mombid IS NULL THEN 'NULL' ELSE NEW.mombid::TEXT END

                       || '): Value (NEW MomId) = (' || CASE WHEN NEW.momid IS NULL THEN 'NULL' ELSE NEW.momid::TEXT END

                       || '): The supplied new MomId and new StudyId values '
                       || 'do not refer to an existant BIOGRAPHY row'
              , HINT = 'The database is case sensitive.  Are upper and lower case characters used appropriately within the data supplied?';
        END IF;

        NEW.mombid := this_mombid;
      END IF;
    END IF;
  ELSE -- momid did not change
    IF NEW.mombid IS NOT NULL
       AND (NEW.mombid <> OLD.mombid
            OR OLD.mombid IS NULL) THEN
      -- Just in case somebody uses a RETURNING clause, set the momid from
      -- the mombid
      SELECT biography.animid
        INTO NEW.momid
        FROM biography
        WHERE biography.bid = NEW.mombid;
      -- If we don't find anything the underlying table will raise an error
    END IF;
  END IF;

  UPDATE biography
    SET bid             = NEW.bid
      , studyid         = NEW.studyid
      , animid          = NEW.animid
      , animname        = NEW.animname
      , momonly         = NEW.momonly
      , birthdate       = NEW.birthdate
      , bdmin           = NEW.bdmin
      , bdmax           = NEW.bdmax
      , bddist          = NEW.bddist
      , birthgroup      = NEW.birthgroup
      , bgqual          = NEW.bgqual
      , firstborn       = NEW.firstborn
      , mombid          = NEW.mombid
      , sex             = NEW.sex
      , entrydate       = NEW.entrydate
      , entrytype       = NEW.entrytype
      , departdate      = NEW.departdate
      , departtype      = NEW.departtype
      , departdateerror = NEW.departdateerror
    WHERE bid = OLD.bid;

  RETURN NEW;
  END;
$$;


ALTER FUNCTION plhdb.biographies_update_func() OWNER TO plhdb_admin;

--
-- Name: biography_all_access(character varying); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.biography_all_access(studyid character varying) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- 
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: biography_all_access()
  --
  -- Arguments:
  --   studyid  STUDY.SId of the biography row
  --
  -- Remarks:
  --   Defines the all_access policy for the BIOGRAPHY table.
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN is_superuser()
    OR EXISTS(
      SELECT 1
        FROM permission
        WHERE (permission.study = studyid
               OR permission.study = 'all')
              AND permission.username = SESSION_USER
              AND permission.access = 'all');

  END;
$$;


ALTER FUNCTION plhdb.biography_all_access(studyid character varying) OWNER TO plhdb_admin;

--
-- Name: biography_commit_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.biography_commit_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- Function for biography insert or update fired upon transaction commit.
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  DECLARE
    this_studyid biography.studyid%TYPE;
    this_momid biography.animid%TYPE;
    this_sex biography.sex%TYPE;

    this_fid fertility.fid%TYPE;
    this_startdate fertility.startdate%TYPE;
    this_starttype fertility.starttype%TYPE;
    this_stopdate fertility.stopdate%TYPE;
    this_stoptype fertility.stoptype%TYPE;

  BEGIN

  -- Get the latest values of the row
  SELECT * INTO NEW FROM biography WHERE biography.bid = NEW.bid;
  IF NOT FOUND THEN
    -- Whatever row was updated was subsequently deleted.
    -- Nothing to do.
    RETURN NULL;
  END IF;

  IF NEW.mombid IS NOT NULL THEN
    -- Mother of this individual must be female.
    SELECT biography.animid, biography.sex
      INTO this_momid, this_sex
      FROM biography
      WHERE biography.bid = NEW.mombid
            AND biography.sex <> 'F';
    IF FOUND THEN
      RAISE EXCEPTION integrity_constraint_violation USING
            MESSAGE = 'Error on BIOGRAPHY ' || TG_OP || ' commit'
          , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (MomBId) = (' || NEW.mombid
                     || '): Value (BIOGRAPHY.AnimId of mother) = ('
                     || this_momid
                     || '): Value (BIOGRAPHY.Sex of mother) = (' || this_sex
                     || '): The Sex value of a mother must be '
                     || '''F''.';
    END IF;
  END IF;

  -- Mother of this individual must be in same study as offspring.
  SELECT biography.animid, biography.studyid
    INTO this_momid, this_studyid
    FROM biography
    WHERE biography.bid = NEW.mombid
          AND biography.studyid <> NEW.studyid;
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on BIOGRAPHY ' || TG_OP || ' commit'
        , DETAIL = 'Key(BId) = (' || NEW.bid
                   || '): Value (StudyId) = (' || NEW.studyid
                   || '): Value (AnimId) = (' || NEW.animid
                   || '): Value (MomBId) = (' || NEW.mombid
                   || '): Value (BIOGRAPHY.AnimId of mother) = ('
                   || this_momid
                   || '): Value (BIOGRAPHY.StudyId of mother) = ('
                   || this_studyid
                   || '): The StudyId value of the offspring must match '
                   || 'that of the mother.';
  END IF;


  IF TG_OP = 'UPDATE' THEN

    IF NEW.sex <> OLD.sex
       AND NEW.sex <> 'F' THEN
 
      -- Individual cannot have offspring unless female.
      -- (Check is on transaction commit because momid is not validated
      -- until then.)
      PERFORM 1
        FROM biography
        WHERE biography.mombid = NEW.bid;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on BIOGRAPHY ' || TG_OP || ' commit'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (Sex) = (' || NEW.sex
                     || '): Sex must be ''F'' because this '
                     || 'individual is another''s mother';
      END IF;

    END IF;

    -- Individual cannot have offspring in a different study.
    IF NEW.studyid <> OLD.studyid THEN
      PERFORM 1
        FROM biography
        WHERE biography.mombid = NEW.bid
              AND biography.studyid <> NEW.studyid;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on BIOGRAPHY ' || TG_OP || ' commit'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): StudyId cannot change because this '
                     || 'individual is another''s mother; the study '
                     || 'of the mother and offspring must match';
      END IF;
    END IF;


    -- Initial StartTypes mean StartDate = EntryDate.
    IF NEW.entrydate <> OLD.entrydate THEN
      SELECT ffi.fid,  ffi.startdate,  ffi.starttype
        INTO this_fid, this_startdate, this_starttype
        FROM fertility AS ffi
             JOIN start_event ON (start_event.code = ffi.starttype)
        WHERE ffi.bid = NEW.bid
              AND ffi.startdate <> NEW.entrydate
              AND start_event.initial;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on BIOGRAPHY ' || TG_OP || ' commit'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (EntryDate) = (' || NEW.entrydate
                     || '): Key(FERTILITY.FId) = ('
                     || this_fid
                     || '): Value(FERTILITY.StartDate) = ('
                     || this_startdate
                     || '): Value(FERTILITY.StartType) = ('
                     || this_starttype
                     || '): FERTILITY.StartDate must be the '
                     || 'EntryDate when StartType is an Initial START_EVENT';
      END IF;
    END IF;


    -- Final StopTypes mean StopDate = DepartDate.
    IF NEW.departdate <> OLD.departdate THEN
      SELECT ffi.fid,  ffi.stopdate,  ffi.stoptype
        INTO this_fid, this_stopdate, this_stoptype
        FROM fertility AS ffi
             JOIN end_event ON (end_event.code = ffi.stoptype)
        WHERE ffi.bid = NEW.bid
              AND ffi.stopdate <> NEW.departdate
              AND end_event.final;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on BIOGRAPHY ' || TG_OP || ' commit'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (DepartDate) = (' || NEW.departdate
                     || '): Key(FERTILITY.FId) = ('
                     || this_fid
                     || '): Value(FERTILITY.StopDate) = ('
                     || this_stopdate
                     || '): Value(FERTILITY.StopType) = ('
                     || this_stoptype
                     || '): FERTILITY.StopDate must be the '
                     || 'DepartDate when StopType is a Final STOP_EVENT';
      END IF;
    END IF;

    -- EntryDate = StartDate requires EntryType = StartType
    IF NEW.entrytype <> OLD.entrytype
       OR NEW.entrydate <> OLD.entrydate THEN
      SELECT ffi.fid,  ffi.startdate,  ffi.starttype
        INTO this_fid, this_startdate, this_starttype
        FROM fertility AS ffi
        WHERE ffi.bid = NEW.bid
              AND ffi.startdate = NEW.entrydate
              AND ffi.starttype <> NEW.entrytype;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on BIOGRAPHY ' || TG_OP || ' commit'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (EntryDate) = (' || NEW.entrydate
                     || '): Value (EntryType) = (' || NEW.entrytype
                     || '): Key(FERTILITY.FId) = (' || this_fid
                     || '): Value(FERTILITY.StartDate) = (' || this_startdate
                     || '): Value(FERTILITY.StartType) = (' || this_starttype
                     || '): When FERTILITY.StartDate equals EntryDate then '
                     || 'EntryType must equal FERTILITY.StartType';
      END IF;
    END IF;

    -- DepartDate = StopDate requires DepartType = StopType
    IF NEW.departtype <> OLD.departtype
       OR NEW.departdate <> OLD.departdate THEN
      SELECT ffi.fid,  ffi.stopdate,  ffi.stoptype
        INTO this_fid, this_stopdate, this_stoptype
        FROM fertility AS ffi
        WHERE ffi.bid = NEW.bid
              AND ffi.stopdate = NEW.departdate
              AND ffi.stoptype <> NEW.departtype;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on BIOGRAPHY ' || TG_OP || ' commit'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (DepartDate) = (' || NEW.departdate
                     || '): Value (DepartType) = (' || NEW.departtype
                     || '): Key(FERTILITY.FId) = (' || this_fid
                     || '): Value(FERTILITY.StopDate) = (' || this_stopdate
                     || '): Value(FERTILITY.StopType) = (' || this_stoptype
                     || '): When FERTILITY.StopDate equals DepartDate then '
                     || 'DepartType must equal FERTILITY.StopType';
      END IF;
    END IF;
  END IF;

  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.biography_commit_func() OWNER TO plhdb_admin;

--
-- Name: biography_edit_access(character varying); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.biography_edit_access(studyid character varying) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- 
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: biography_edit_access()
  --
  -- Arguments:
  --   studyid  STUDY.SId of the biography row
  --
  -- Remarks:
  --   Defines the edit_access policy for the BIOGRAPHY table.
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN is_superuser()
    OR EXISTS(
      SELECT 1
        FROM permission
        WHERE (permission.study = studyid
               OR permission.study = 'all')
              AND permission.username = SESSION_USER
              AND (permission.access = 'edit'
                   OR permission.access = 'all'));
  END;
$$;


ALTER FUNCTION plhdb.biography_edit_access(studyid character varying) OWNER TO plhdb_admin;

--
-- Name: biography_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.biography_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  BEGIN
  -- Function for biography insert and update triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  IF TG_OP = 'UPDATE' THEN
    -- Keep life simple and restrict key changes.
    
  IF NEW.BId <> OLD.BId THEN
    -- BId has changed
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on UPDATE of BIOGRAPHY'
        , DETAIL =  'Value (BId) = (' || OLD.BId
                    || '): BIOGRAPHY.BId cannot be changed';
    RETURN NULL;
  END IF;

  END IF;

  -- Birthdates with a "symmetric" (normal) distribution must have their
  -- birth date halfway between the min and max range.  Or one of the
  -- two midpoint dates if the range has an even number of days.
  IF NEW.birthdate IS NOT NULL
     AND ABS((NEW.birthdate - NEW.bdmin)
             - (NEW.bdmax - NEW.birthdate))
            > 1 THEN
    PERFORM 1
      FROM probability_type
      WHERE probability_type.code = NEW.bddist
            AND probability_type.symmetrical;
    IF FOUND THEN
      RAISE EXCEPTION integrity_constraint_violation USING
            MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHY'
          , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (BirthDate) = (' || NEW.BirthDate
                     || '): Value (BDMin) = (' || NEW.bdmin
                     || '): Value (BDMax) = (' || NEW.bdmax
                     || '): Value (BDDist) = (' || NEW.bddist
                     || '): When a BDDist relates to a PROBABILITY_TYPE '
                     || 'row with a TRUE Symmetrical value (as is set '
                     || 'for normal distributions), the BirthDate '
                     || 'must fall midway between BDMin and BDMax';
    END IF;
  END IF;


  IF TG_OP = 'UPDATE' THEN

    -- Individuals who have rows only because they are another's mother
    -- cannot have female fertility intervals.
    IF NEW.MomOnly <> OLD.MomOnly
       AND NEW.MomOnly THEN
      PERFORM 1
        FROM fertility
        WHERE fertility.bid = NEW.bid;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHY'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (MomOnly) = (' || NEW.momonly
                     || '): Rows with MomOnly = TRUE cannot '
                     || 'have a related FEMALEFERTILTIYINTERVAL row';

      END IF;
    END IF;

    IF NEW.sex <> OLD.sex
       AND NEW.sex <> 'F' THEN

      -- Individual cannot have female fertility intervals unless female.
      PERFORM 1
        FROM fertility
        WHERE fertility.bid = NEW.bid;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHY'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (Sex) = (' || NEW.sex
                     || '): Sex must be ''F'' because this '
                     || 'individual has related FERTILITY '
                     || 'rows';
      END IF;

    END IF;

    -- Individual cannot have female fertility intervals after
    -- departure date + (departdateerror years).
    IF (NEW.departdate <> OLD.departdate
        AND NEW.departdate < OLD.departdate)
       OR (COALESCE(NEW.departdateerror, 0)::double precision
            <> COALESCE(OLD.departdateerror, 0)::double precision
           AND COALESCE(OLD.departdateerror, 0)::double precision
             < COALESCE(NEW.departdateerror, 0)::double precision) THEN
      PERFORM 1
        FROM fertility AS ffi
        WHERE ffi.bid = NEW.bid
              AND last_departdate(NEW.departdate, NEW.departdateerror)
                  < ffi.stopdate;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHY'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (DepartDate) = (' || NEW.departdate
                     || '): Value (DepartDateError) = ('
                     || COALESCE(NEW.departdateerror::text, 'NULL') 
                     || '): There is a related FERTILITY row '
                     || 'which has a StopDate value after the computed '
                     || 'new last possible departure date; the computed '
                     || 'last possible departure date is: '
                     || last_departdate(NEW.departdate, NEW.departdateerror);
      END IF;
    END IF;

    -- Individual cannot have female fertility intervals before
    -- entry date.
    IF NEW.entrydate <> OLD.entrydate
       AND NEW.entrydate > OLD.entrydate THEN
      PERFORM 1
        FROM fertility AS ffi
        WHERE ffi.bid = NEW.bid
              AND ffi.startdate < NEW.entrydate;
      IF FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of BIOGRAPHY'
            , DETAIL = 'Key(BId) = (' || NEW.bid
                     || '): Value (StudyId) = (' || NEW.studyid
                     || '): Value (AnimId) = (' || NEW.animid
                     || '): Value (EntryDate) = (' || NEW.entrydate
                     || '): There is a related FERTILITY row '
                     || 'which has a StartDate value preceding the new '
                     || 'EntryDate';
      END IF;
    END IF;

  END IF;  -- UPDATE
  

  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.biography_func() OWNER TO plhdb_admin;

--
-- Name: biography_insert_access(character varying); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.biography_insert_access(studyid character varying) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- 
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: biography_insert_access()
  --
  -- Arguments:
  --   studyid  STUDY.SId of the biography row
  --
  -- Remarks:
  --   Defines the insert_access policy for the BIOGRAPHY table.
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN is_superuser()
    OR EXISTS(
      SELECT 1
        FROM permission
        WHERE (permission.study = studyid
               OR permission.study = 'all')
              AND permission.username = SESSION_USER
              AND (permission.access = 'insert'
                   OR permission.access = 'edit'
                   OR permission.access = 'all'));

  END;
$$;


ALTER FUNCTION plhdb.biography_insert_access(studyid character varying) OWNER TO plhdb_admin;

--
-- Name: biography_search_access(character varying); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.biography_search_access(studyid character varying) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- 
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: biography_search_access(studyid, uname)
  --
  -- Arguments:
  --   studyid  STUDY.SId of the biography row
  --
  -- Remarks:
  --   Defines the search_access policy for the BIOGRAPHY table.
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN is_superuser()
    OR EXISTS(
      SELECT 1
        FROM permission
        WHERE (permission.study = studyid
               OR permission.study = 'all')
              AND permission.username = SESSION_USER
              AND (permission.access = 'search'
                   OR permission.access = 'insert'
                   OR permission.access = 'edit'
                   OR permission.access = 'all'));
  END;
$$;


ALTER FUNCTION plhdb.biography_search_access(studyid character varying) OWNER TO plhdb_admin;

--
-- Name: end_event_update_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.end_event_update_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  BEGIN
  -- Function for end_event insert and update triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  IF OLD.Final <> NEW.final
    AND NEW.Final THEN
    -- Final StopTypes mean StopDate = DepartDate.
    PERFORM 1
      FROM biography
           JOIN fertility AS ffi ON (ffi.bid = biography.bid)
      WHERE ffi.stoptype = NEW.code
            AND biography.departdate <> ffi.stopdate;
    IF FOUND THEN
      RAISE EXCEPTION integrity_constraint_violation USING
            MESSAGE = 'Error on ' || TG_OP || ' of END_EVENT'
        , DETAIL = 'Key(Code) = (' || NEW.code
                   || '): Value (Final) = (' || NEW.final
                   || '): Cannot make Final = TRUE; there is a related '
                   || 'FERTILITY row using this Code for '
                   || 'a StopType but it''s related BIOGRAPHY.DepartDate '
                   || 'is not the fertility interval StopDate';
    END IF;
  END IF;

  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.end_event_update_func() OWNER TO plhdb_admin;

--
-- Name: fertilities_delete_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.fertilities_delete_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- Function for fertilities delete trigger
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  DECLARE

  BEGIN

    -- Check PLHDB permissions
    IF NOT(fertility_all_access(OLD.bid)) THEN
      RAISE EXCEPTION insufficient_privilege USING
            MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
          , DETAIL = 'Key(FId) = (' || OLD.fid
                     || '): Value (BId) = (' || OLD.Bid
                     || '): Value (StudyId) = (' || OLD.studyid
                     || '): Value (AnimId) = (' || OLD.animid
                     || '): Permission denied to this row'
          , HINT = 'To delete this row, ''all'' level PLHDB permission '
                   || 'to the StudyId is required ';
    END IF;

    -- Delete from the underlying table
    DELETE
      FROM fertility
      WHERE fertility.fid = OLD.fid;

  RETURN OLD;
  END;
$$;


ALTER FUNCTION plhdb.fertilities_delete_func() OWNER TO plhdb_admin;

--
-- Name: fertilities_insert_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.fertilities_insert_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  DECLARE
    this_animid  biography.animid%TYPE;
    this_studyid biography.studyid%TYPE;

  BEGIN
  -- Function for fertilities insert triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  -- Check data validity/lookup unspecified data

  IF NEW.animid IS NOT NULL
     OR NEW.studyid IS NOT NULL THEN

    IF NEW.bid IS NULL THEN

      IF NEW.studyid IS NULL
         OR NEW.animid IS NULL THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                     || '): Value (BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): Not enough information supplied to identify '
                     || 'a BIOGRAPHY row'
            , HINT = 'Either BId or both StudyId and AnimId are required';
      END IF;

      -- Get the bid that goes with the given animid and studyid
      SELECT biography.bid
        INTO NEW.bid
        FROM biography
        WHERE biography.studyid = NEW.studyid
              AND biography.animid = NEW.animid;
      IF NOT FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                       || '): Value (BId) = (NULL'
                       || '): Value (StudyId) = (' || NEW.studyid
                       || '): Value (AnimId) = (' || NEW.animid
                       || '): The supplied StudyId and AnimId values do not '
                       || 'identify an existing BIOGRAPHY row';
      END IF;

    ELSE -- Bid is not NULL

      -- Both animid+studyid and bid must refer to the same individual.
      SELECT biography.studyid, biography.animid
        INTO this_studyid, this_animid
        FROM biography
        WHERE biography.bid = NEW.bid;
      IF NOT FOUND THEN
        
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                     || '): Value (BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): The supplied BId value does not '
                     || 'refer to an existing BIOGRAPHY row';

      END IF;

      IF (NEW.animid <> this_animid
          AND NEW.animid IS NOT NULL)
         OR (NEW.studyid <> this_studyid
             AND NEW.studyid IS NOT NULL) THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                     || '): Value (FERTILITIES.BId) = (' || NEW.bid
                     || '): Value (FERTILITIES.StudyId) = ('
                     || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (FERTILITIES.AnimId) = ('
                     || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): Value (BIOGRAPHY.BId) = (' || NEW.bid
                     || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                     || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                     || '): The supplied FERTILITIES AnimId StudyId '
                     || 'combination do not refer to the BIOGRAPHY row '
                     || 'identified by the supplied BId'
            , HINT = 'The database is case sensitive.  Are upper and lower case characters used appropriately within the data supplied?';
      END IF;

      -- Set the values in case one is NULL and a RETURNING clause is used
      NEW.animid := this_animid;
      NEW.studyid := this_studyid;
    END IF;

  ELSE  -- Neither animid nor studyid was supplied (non-NULL)

    IF NEW.bid IS NULL THEN
      
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                     || '): Value (BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): The supplied BId value does not '
                     || 'refer to an existing BIOGRAPHY row';

    END IF;

    -- Get the animd and studyid in case RETURNING is used and to
    -- check PLHDB permissions.
    SELECT biography.studyid, biography.animid
        INTO this_studyid,    this_animid
        FROM biography
        WHERE biography.bid = NEW.bid;
    IF NOT FOUND THEN
      
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                     || '): Value (BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): The supplied BId value does not '
                     || 'refer to an existing BIOGRAPHY row';

    END IF;

    NEW.studyid := this_studyid;
    NEW.animid  := this_animid;
  END IF;

  -- Check PLHDB permissions (now we have a studyid)

  IF NOT(biography_insert_access(NEW.studyid)) THEN
    RAISE EXCEPTION insufficient_privilege USING
          MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
        , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                   || '): Value (BId) = (' || NEW.bid
                   || '): Value (StudyId) = (' || NEW.studyid
                   || '): Value (AnimId) = (' || NEW.animid
                   || '): Permission denied to this row'
        , HINT = 'To insert this row, ''insert'' level PLHDB permission '
                 || 'to the StudyId is required ';
  END IF;

  -- Make sure we have a fid
  IF NEW.fid IS NULL THEN
    SELECT nextval('fertility_fid_seq'::REGCLASS)
      INTO NEW.fid;
  END IF;

  -- Insert the underlying fertility row
  INSERT INTO fertility (
        fid
      , bid
      , startdate
      , starttype
      , stopdate
      , stoptype)
    VALUES(NEW.fid
         , NEW.bid
         , NEW.startdate
         , NEW.starttype
         , NEW.stopdate
         , NEW.stoptype);

  RETURN NEW;
  END;
$$;


ALTER FUNCTION plhdb.fertilities_insert_func() OWNER TO plhdb_admin;

--
-- Name: fertilities_update_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.fertilities_update_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  DECLARE
    this_animid  biography.animid%TYPE;
    this_studyid biography.studyid%TYPE;

  BEGIN
  -- Function for fertilities update triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  -- Check PLHDB permissions

  -- Check access to the old study.
  IF NOT(biography_edit_access(OLD.studyid)) THEN
    RAISE EXCEPTION insufficient_privilege USING
          MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
        , DETAIL = 'Key(OLD FId) = (' || OLD.fid
                   || '): Value (OLD BId) = (' || OLD.bid
                   || '): Value (OLD StudyId) = (' || OLD.studyid
                   || '): Value (OLD AnimId) = (' || OLD.animid
                   || '): Key(NEW FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                   || '): Value (NEW BId) = ('
                   || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                   || '): Value (NEW StudyId) = ('
                   || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                   || '): Value (NEW AnimId) = ('
                   || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                   || '): Permission denied to this row'
        , HINT = 'To update this row, ''edit'' level PLHDB permission '
                 || 'to the old StudyId is required ';
  END IF;


  -- Update the underlying table

  -- What is the new studyid or animid?
  -- It is a change in studyid or animid that registers.
  IF NEW.studyid IS DISTINCT FROM OLD.studyid
     OR NEW.animid IS DISTINCT FROM OLD.animid THEN

    IF NEW.bid IS DISTINCT FROM OLD.bid THEN
      -- bid changed also
      -- Are the new bid and new animid+studyid referencing the same row?
      SELECT biography.studyid, biography.animid
        INTO this_studyid,      this_animid
        FROM biography
        WHERE biography.bid = NEW.bid;
      IF NOT FOUND THEN
        
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                     || '): Value (BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): The supplied BId value does not '
                     || 'refer to an existing BIOGRAPHY row';

      END IF;

      IF NEW.studyid IS DISTINCT FROM this_studyid
         OR NEW.animid IS DISTINCT FROM this_animid THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(OLD FId) = (' || OLD.fid
                     || '): Value (OLD BId) = (' || OLD.bid
                     || '): Value (OLD StudyId) = (' || OLD.studyid
                     || '): Value (OLD AnimId) = (' || OLD.animid
                     || '): Key(NEW BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (NEW StudyId) = ('
                     || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (NEW AnimId) = ('
                     || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): Key (BIOGRAPHY.BId) = (' || NEW.bid
                     || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                     || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                     || '): The supplied new StudyId/AnimId combination '
                     || 'do not refer to the same BIOGRAPHY row as the '
                     || 'new Bid'
            , HINT = 'The database is case sensitive.  Are upper and lower case characters used appropriately within the data supplied?';
      END IF;
    ELSE -- bid did not change
      -- Get the bid to go with the changed studyid/animid
      SELECT biography.bid
        INTO NEW.bid
        FROM biography
        WHERE biography.studyid = NEW.studyid
              AND biography.animid = NEW.animid;
      IF NOT FOUND THEN
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(OLD FId) = (' || OLD.fid
                       || '): Value (OLD BId) = (' || OLD.bid
                       || '): Value (OLD StudyId) = (' || OLD.studyid
                       || '): Value (OLD AnimId) = (' || OLD.animid
                       || '): Key(NEW BId) = (' || OLD.bid -- deliberate OLD,
                                                           -- NEW is lost
                       || '): Value (NEW StudyId) = ('
                       || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                       || '): Value (NEW AnimId) = ('
                       || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                       || '): The supplied new StudyId and new AnimId values '
                       || 'do not refer to an existant BIOGRAPHY row'
            , HINT = 'The database is case sensitive.  Are upper and lower case characters used appropriately within the data supplied?';
      END IF;
    END IF;
  ELSE  -- Neither studyid nor animid changed

    IF NEW.bid IS NULL THEN
      
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                     || '): Value (BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): The supplied BId value does not '
                     || 'refer to an existing BIOGRAPHY row';

    END IF;

    IF NEW.bid <> OLD.bid THEN
      -- Set the new studyid and animid, for a RETURNING clause and for
      -- PLHDB permission checking.
      SELECT biography.studyid, biography.animid
        INTO NEW.studyid,       NEW.animid
        FROM biography
        WHERE biography.bid = NEW.bid;
      IF NOT FOUND THEN
        
        RAISE EXCEPTION integrity_constraint_violation USING
              MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
            , DETAIL = 'Key(FId) = (' || CASE WHEN NEW.fid IS NULL THEN 'NULL' ELSE NEW.fid::TEXT END

                     || '): Value (BId) = (' || CASE WHEN NEW.bid IS NULL THEN 'NULL' ELSE NEW.bid::TEXT END

                     || '): Value (StudyId) = (' || CASE WHEN NEW.studyid IS NULL THEN 'NULL' ELSE NEW.studyid::TEXT END

                     || '): Value (AnimId) = (' || CASE WHEN NEW.animid IS NULL THEN 'NULL' ELSE NEW.animid::TEXT END

                     || '): The supplied BId value does not '
                     || 'refer to an existing BIOGRAPHY row';

      END IF;
    END IF;
  END IF;

  -- Check PLHDB permissions

  -- Check access to new study.  (Now that we have the studyid.)

  IF NEW.studyid <> OLD.studyid
     AND NOT(biography_edit_access(NEW.studyid)) THEN
    RAISE EXCEPTION insufficient_privilege USING
          MESSAGE = 'Error on ' || TG_OP || ' of FERTILITIES'
        , DETAIL = 'Key(OLD FId) = (' || OLD.fid
                   || '): Value (OLD BId) = (' || OLD.bid
                   || '): Value (OLD StudyId) = (' || OLD.studyid
                   || '): Value (OLD AnimId) = (' || OLD.animid
                   || '): Key(NEW BId) = (' || NEW.bid
                   || '): Value (NEW StudyId) = (' || NEW.studyid
                   || '): Value (NEW AnimId) = (' || NEW.animid
                   || '): Permission denied to this row'
        , HINT = 'To update this row, ''edit'' level PLHDB permission '
                 || 'to the new StudyId is required ';
  END IF;

  UPDATE fertility
    SET fid        = NEW.fid
      , bid        = NEW.bid
      , startdate  = NEW.startdate
      , starttype  = NEW.starttype
      , stopdate   = NEW.stopdate
      , stoptype   = NEW.stoptype
    WHERE fid = OLD.fid;

  RETURN NEW;
  END;
$$;


ALTER FUNCTION plhdb.fertilities_update_func() OWNER TO plhdb_admin;

--
-- Name: fertility_all_access(integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.fertility_all_access(this_bid integer) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- 
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: fertility_all_access()
  --
  -- Arguments:
  --   studyid  STUDY.SId of the related biography row
  --
  -- Remarks:
  --   Defines the all_access policy for the FERTILITY table.
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN is_superuser()
    OR EXISTS(
      SELECT 1
        FROM biography
             JOIN permission
                  ON (permission.study = biography.studyid
                      OR permission.study = 'all')
        WHERE biography.bid = this_bid
              AND permission.username = SESSION_USER
              AND permission.access = 'all');

  END;
$$;


ALTER FUNCTION plhdb.fertility_all_access(this_bid integer) OWNER TO plhdb_admin;

--
-- Name: fertility_commit_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.fertility_commit_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- Function for fertility insert and update
  -- fired upon transaction commit.
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  DECLARE
    this_studyid biography.studyid%TYPE;
    this_animid biography.animid%TYPE;
    this_entrydate biography.entrydate%TYPE;
    this_entrytype biography.entrytype%TYPE;
    this_departdate biography.departdate%TYPE;
    this_departtype biography.departtype%TYPE;

  BEGIN

  -- Get the latest values of the row
  SELECT *
    INTO NEW
    FROM fertility
    WHERE fertility.fid = NEW.fid;
  IF NOT FOUND THEN
    -- Whatever row was inserted was subsequently deleted.
    -- Nothing to do.
    RETURN NULL;
  END IF;

  -- Initial StartTypes mean StartDate = EntryDate.
  SELECT biography.studyid, biography.animid, biography.entrydate
    INTO this_studyid,      this_animid,      this_entrydate
    FROM biography
         JOIN start_event ON (start_event.code = NEW.starttype)
    WHERE biography.bid = NEW.bid
          AND biography.entrydate <> NEW.startdate
          AND start_event.initial;
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on FERTILITY ' || TG_OP || ' commit'
        , DETAIL = 'Key(FId) = (' || NEW.fid
                   || '): Value (BId) = (' || NEW.Bid
                   || '): Value(StartDate) = (' || NEW.startdate
                   || '): Value(StartType) = (' || NEW.starttype
                   || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                   || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                   || '): Value (BIOGRAPHY.EntryDate) = (' || this_entrydate
                   || '): StartDate must be the BIOGRAPHY.EntryDate when '
                   || 'StartType is an Initial START_EVENT'
        , HINT = 'Look at the rows of the START_EVENT table to see which '
                 || 'events are Initial events; the (' || NEW.starttype
                 || ') StartType is one.';
  END IF;

  -- Final StopTypes mean StopDate = DepartDate.
  SELECT biography.studyid, biography.animid, biography.departdate
    INTO this_studyid,      this_animid,      this_departdate
    FROM biography
         JOIN end_event ON (end_event.code = NEW.stoptype)
    WHERE biography.bid = NEW.bid
          AND biography.departdate <> NEW.stopdate
          AND end_event.final;
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on FERTILITY ' || TG_OP || ' commit'
        , DETAIL = 'Key(FId) = (' || NEW.fid
                   || '): Value (BId) = (' || NEW.Bid
                   || '): Value(StopDate) = (' || NEW.stopdate
                   || '): Value(StopType) = (' || NEW.stoptype
                   || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                   || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                   || '): Value (BIOGRAPHY.DepartDate) = (' || this_departdate
                   || '): StopDate must be the BIOGRAPHY.DepartDate when '
                   || 'StopType is a Final STOP_EVENT'
        , HINT = 'Look at the rows of the STOP_EVENT table to see which '
                 || 'events are Final events; the (' || NEW.stoptype
                 || ') StopType is one.';
  END IF;
  
  -- StartDate = EntryDate requires StartType = EntryType.
  SELECT biography.studyid, biography.animid, biography.entrydate
       , biography.entrytype
    INTO this_studyid,      this_animid,      this_entrydate
       , this_entrytype
    FROM biography
    WHERE biography.bid = NEW.bid
          AND biography.entrydate = NEW.startdate
          AND biography.entrytype <> NEW.starttype;
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on FERTILITY ' || TG_OP || ' commit'
        , DETAIL = 'Key(FId) = (' || NEW.fid
                   || '): Value (BId) = (' || NEW.Bid
                   || '): Value(StartDate) = (' || NEW.startdate
                   || '): Value(StartType) = (' || NEW.starttype
                   || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                   || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                   || '): Value (BIOGRAPHY.EntryDate) = (' || this_entrydate
                   || '): Value (BIOGRAPHY.EntryType) = (' || this_entrytype
                   || '): When StartDate equals EntryDate then StartType '
                   || 'must equal EntryType';
  END IF;
  
  -- StopDate = DepartDate requires StopType = DepartType.
  SELECT biography.studyid, biography.animid, biography.departdate
       , biography.departtype
    INTO this_studyid,      this_animid,      this_departdate
       , this_departtype
    FROM biography
    WHERE biography.bid = NEW.bid
          AND biography.departdate = NEW.stopdate
          AND biography.departtype <> NEW.stoptype;
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on FERTILITY ' || TG_OP || ' commit'
        , DETAIL = 'Key(FId) = (' || NEW.fid
                   || '): Value (BId) = (' || NEW.Bid
                   || '): Value(StopDate) = (' || NEW.stopdate
                   || '): Value(StopType) = (' || NEW.stoptype
                   || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                   || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                   || '): Value (BIOGRAPHY.DepartDate) = (' || this_departdate
                   || '): Value (BIOGRAPHY.DepartType) = (' || this_departtype
                   || '): When StopDate equals DepartDate then StopType '
                   || 'must equal DepartType';
  END IF;

  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.fertility_commit_func() OWNER TO plhdb_admin;

--
-- Name: fertility_edit_access(integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.fertility_edit_access(this_bid integer) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- 
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: fertility_edit_access()
  --
  -- Arguments:
  --   studyid  STUDY.SId of the related biography row
  --
  -- Remarks:
  --   Defines the edit_access policy for the FERTILITY table.
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN is_superuser()
    OR EXISTS(
      SELECT 1
        FROM biography
             JOIN permission
                  ON (permission.study = biography.studyid
                      OR permission.study = 'all')
        WHERE biography.bid = this_bid
              AND permission.username = SESSION_USER
              AND (permission.access = 'edit'
                   OR permission.access = 'all'));
  END;
$$;


ALTER FUNCTION plhdb.fertility_edit_access(this_bid integer) OWNER TO plhdb_admin;

--
-- Name: fertility_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.fertility_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  DECLARE
    this_studyid biography.studyid%TYPE;
    this_animid biography.animid%TYPE;
    this_sex biography.sex%TYPE;
    this_entrydate biography.entrydate%TYPE;
    this_departdate biography.departdate%TYPE;
    this_departdateerror biography.departdateerror%TYPE;
    this_startdate fertility.startdate%TYPE;
    this_stopdate fertility.stopdate%TYPE;
    this_fid fertility.fid%TYPE;

  BEGIN
  -- Function for fertility insert and update triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  IF TG_OP = 'UPDATE' THEN
    
  IF NEW.FId <> OLD.FId THEN
    -- FId has changed
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on UPDATE of FERTILITY'
        , DETAIL =  'Value (FId) = (' || OLD.FId
                    || '): FERTILITY.FId cannot be changed';
    RETURN NULL;
  END IF;

  END IF;

  -- MomOnly rows cannot have related FERTILITY rows.
  SELECT biography.studyid, biography.animid
    INTO this_studyid,      this_animid
    FROM biography
    WHERE biography.bid = NEW.bid
          AND biography.momonly;
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on ' || TG_OP || ' of FERTILITY'
        , DETAIL = 'Key(FId) = (' || NEW.fid
                   || '): Value (BId) = (' || NEW.Bid
                   || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                   || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                   || '): Individuals with BIOGRAPHY.MomOnly = TRUE '
                   || 'cannot have related FERTILITY rows';
  END IF;

  -- Non-female individuals cannot have related FERTILITY rows.
  SELECT biography.studyid, biography.animid, biography.sex
    INTO this_studyid,      this_animid,      this_sex
    FROM biography
    WHERE biography.bid = NEW.bid
          AND biography.sex <> 'F';
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on ' || TG_OP || ' of FERTILITY'
        , DETAIL = 'Key(FId) = (' || NEW.fid
                   || '): Value (BId) = (' || NEW.Bid
                   || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                   || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                   || '): Value (BIOGRAPHY.Sex) = (' || this_sex
                   || '): Only individuals with BIOGRAPHY.Sex = '
                   || '''F'' can have related '
                   || 'FERTILITY rows';
  END IF;

  -- StopDate cannot be after DepartDate + (DepartDateError years)
  SELECT biography.studyid, biography.animid, biography.departdate
       , biography.departdateerror
    INTO this_studyid,      this_animid,      this_departdate
       , this_departdateerror
    FROM biography
    WHERE biography.bid = NEW.bid
          AND last_departdate(biography.departdate, biography.departdateerror)
              < NEW.stopdate;
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on ' || TG_OP || ' of FERTILITY'
        , DETAIL = 'Key(FId) = (' || NEW.fid
                   || '): Value (BId) = (' || NEW.Bid
                   || '): Value(StopDate) = (' || NEW.stopdate
                   || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                   || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                   || '): Value (BIOGRAPHY.DepartDate) = (' || this_departdate
                   || '): Value (BIOGRAPHY.DepartDateError) = ('
                   || COALESCE(this_departdateerror::text, 'NULL')
                   || '): StopDate cannot follow the DepartDate + '
                   || '(DepartDateError years) of the related BIOGRAPHY '
                   || 'row; the computed last departure date is: '
                   || last_departdate(this_departdate, this_departdateerror);
  END IF;

  -- StartDate cannot be before EntryDate.
  SELECT biography.studyid, biography.animid, biography.entrydate
    INTO this_studyid,      this_animid,      this_entrydate
    FROM biography
    WHERE biography.bid = NEW.bid
          AND NEW.startdate < biography.entrydate;
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on ' || TG_OP || ' of FERTILITY'
        , DETAIL = 'Key(FId) = (' || NEW.fid
                   || '): Value (BId) = (' || NEW.Bid
                   || '): Value(StartDate) = (' || NEW.startdate
                   || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                   || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                   || '): Value (BIOGRAPHY.EntryDate) = (' || this_entrydate
                   || '): StartDate cannot precede the EntryDate '
                   || 'of the related BIOGRAPHY row';
  END IF;

  -- Female fertility intervals cannot overlap.
  SELECT biography.studyid, biography.animid,
         ffi.fid,  ffi.startdate,  ffi.stopdate
    INTO this_studyid,      this_animid,
         this_fid, this_startdate, this_stopdate
    FROM fertility AS ffi
         JOIN biography ON (biography.bid = NEW.bid)
    WHERE ffi.fid <> NEW.fid
          AND ffi.bid = NEW.bid
          AND ((NEW.startdate <= ffi.startdate
                AND ffi.startdate <= NEW.stopdate)
               OR (NEW.startdate <= ffi.stopdate
                   AND ffi.stopdate <= NEW.stopdate));
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on ' || TG_OP || ' of FERTILITY'
        , DETAIL = 'Key(FId) = (' || NEW.fid
                   || '): Value (BId) = (' || NEW.Bid
                   || '): Value (BIOGRAPHY.StudyId) = (' || this_studyid
                   || '): Value (BIOGRAPHY.AnimId) = (' || this_animid
                   || '): Value(StartDate) = (' || NEW.startdate
                   || '): Value(StopDate) = (' || NEW.stopdate
                   || '): Key(Other FId) = (' || this_fid
                   || '): Value(Other StartDate) = (' || this_startdate
                   || '): Value(Other StopDate) = (' || this_stopdate
                   || '): The female fertility intervals of a single '
                   || 'individual cannot overlap';
  END IF;

  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.fertility_func() OWNER TO plhdb_admin;

--
-- Name: fertility_insert_access(integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.fertility_insert_access(this_bid integer) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- 
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: fertility_insert_access()
  --
  -- Arguments:
  --   studyid  STUDY.SId of the related biography row
  --
  -- Remarks:
  --   Defines the insert_access policy for the FERTILITY table.
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN is_superuser()
    OR EXISTS(
      SELECT 1
        FROM biography
             JOIN permission
                  ON (permission.study = biography.studyid
                      OR permission.study = 'all')
        WHERE biography.bid = this_bid
              AND permission.username = SESSION_USER
              AND (permission.access = 'insert'
                   OR permission.access = 'edit'
                   OR permission.access = 'all'));

  END;
$$;


ALTER FUNCTION plhdb.fertility_insert_access(this_bid integer) OWNER TO plhdb_admin;

--
-- Name: fertility_search_access(integer); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.fertility_search_access(this_bid integer) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- 
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: fertility_search_access(studyid, uname)
  --
  -- Arguments:
  --   studyid  STUDY.SId of the related biography row
  --
  -- Remarks:
  --   Defines the search_access policy for the FERTILITY table.
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN is_superuser()
    OR EXISTS(
      SELECT 1
        FROM biography
             JOIN permission
                  ON (permission.study = biography.studyid
                      OR permission.study = 'all')
        WHERE biography.bid = this_bid
              AND permission.username = SESSION_USER
              AND (permission.access = 'search'
                   OR permission.access = 'insert'
                   OR permission.access = 'edit'
                   OR permission.access = 'all'));
  END;
$$;


ALTER FUNCTION plhdb.fertility_search_access(this_bid integer) OWNER TO plhdb_admin;

--
-- Name: is_superuser(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.is_superuser() RETURNS boolean
    LANGUAGE plpgsql STABLE LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- Is the SESSION_USER a superuser?
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: is_superuser()
  --
  -- Remarks:
  --   Returns TRUE if the SESSION_USER is a superuser.
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN (SELECT pg_roles.rolsuper
            FROM pg_roles
            WHERE pg_roles.rolname = SESSION_USER);
  END;
$$;


ALTER FUNCTION plhdb.is_superuser() OWNER TO plhdb_admin;

--
-- Name: FUNCTION is_superuser(); Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON FUNCTION plhdb.is_superuser() IS 'Is the SESSION_USER a superuser?  This function is used where we
would really want to use instead a row_security_active() function that
tests SESSION_USER (not CURRENT_USER as the PG 9.5
row_security_active() does).';


--
-- Name: last_departdate(date, double precision); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.last_departdate(departdate date, departdateerror double precision) RETURNS date
    LANGUAGE plpgsql IMMUTABLE STRICT LEAKPROOF
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- One line description
  --
  -- Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.
  --
  -- Syntax: last_departdate(departdate, departdateerror)
  --
  -- Arguments:
  --   departdate  A date
  --   departdateerror  Double precision float; number of years
  --
  -- Remarks:
  --   Compute the last departure date
  --
  -- Bugs:

  DECLARE

  BEGIN

  RETURN 
         departdate
         + CEIL(COALESCE (departdateerror, 0)::double precision * '365.25'::DOUBLE PRECISION)::INT;
  END;
$$;


ALTER FUNCTION plhdb.last_departdate(departdate date, departdateerror double precision) OWNER TO plhdb_admin;

--
-- Name: FUNCTION last_departdate(departdate date, departdateerror double precision); Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON FUNCTION plhdb.last_departdate(departdate date, departdateerror double precision) IS 'Given a departure date and a departure date error returns the latest
possible departure date.  Fractions of a day are _not_ truncated;
e.g. if the computed latest possible departure ends at 9AM that date
is returned.  Any part of a day at the end of the computed interval is
considered to be an entire day for purposes of the computation.

When departure date error is NULL, the last depart date is calculated
as though the error were 0.

This function is used whenever the system computes an individual''s
latest possible departure date.  It is also available for use in
queries.

Example:
  SELECT studyid, animid, departdate, departdateerror
       , last_departdate(departdate, departdateerror) AS max_departdate
    FROM biography;';


--
-- Name: permission_delete_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.permission_delete_func() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- Function for permission delete trigger
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  DECLARE

  BEGIN

  -- Does the user still need UPDATE to the sequences?
  IF OLD.access <> 'search' THEN
    
      PERFORM 1
        FROM permission
        WHERE permission.username = OLD.username
              AND permission.access <> 'search';
      IF NOT FOUND THEN
        -- User has only search permission, if that.
        EXECUTE 'REVOKE UPDATE '
                  'ON SEQUENCE biography_bid_seq '
                  'FROM ' || OLD.username || ';';
        EXECUTE 'REVOKE UPDATE '
                  'ON SEQUENCE biography_bid_seq '
                  'FROM ' || OLD.username || ';';
        EXECUTE 'REVOKE USAGE '
                  'ON SEQUENCE biography_bid_seq '
                  'FROM ' || OLD.username || ';';
        EXECUTE 'REVOKE USAGE '
                  'ON SEQUENCE biography_bid_seq '
                  'FROM ' || OLD.username || ';';
      END IF;

  END IF;

  -- Does the user still need SELECT on the sequences?
  PERFORM 1
    FROM permission
    WHERE permission.username = OLD.username;
  IF NOT FOUND THEN
    -- The user has no permissions.
    EXECUTE 'REVOKE SELECT '
              'ON SEQUENCE biography_bid_seq '
              'FROM ' || OLD.username || ';';
    EXECUTE 'REVOKE SELECT '
              'ON SEQUENCE fertility_fid_seq '
              'FROM ' || OLD.username || ';';
  END IF;

  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.permission_delete_func() OWNER TO plhdb_admin;

--
-- Name: permission_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.permission_func() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  DECLARE
    this_username permission.username%TYPE;
    this_oid permission.pid%TYPE;
    this_count INT;

  BEGIN
  -- Function for permission insert and update triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  IF TG_OP = 'UPDATE' THEN
    -- For sanity, can't change the username.
    
  IF NEW.UserName <> OLD.UserName THEN
    -- UserName has changed
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on UPDATE of PERMISSION'
        , DETAIL =  'Value (UserName) = (' || OLD.UserName
                    || '): PERMISSION.UserName cannot be changed';
    RETURN NULL;
  END IF;

  END IF;

  -- Username must be a role.
  -- Because this is not a constraint roles can go away.  So we
  -- check every row on PERMISSIONS on every insert or update to
  -- the table.  We are sure to report which Username value is the problem.
  SELECT permission.username, permission.pid
    INTO this_username,       this_oid
    FROM permission
    WHERE NOT EXISTS (
      SELECT 1
        FROM pg_roles
        WHERE pg_roles.rolname = permission.username
              AND pg_roles.rolcanlogin);
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on ' || TG_OP || ' of PERMISSION'
        , DETAIL = 'Key (Pid) = (' || this_oid
                   || '): Value (Username) = (' || this_username
                   || '): PERMISSION.Username must be a PG_ROLES.Rolname '
                   || 'value of a role with login priviliges'
        , HINT = 'Problem discovered on ' || TG_OP
                  || ' of PERMISSION with Key (Pid) = ('
                  || NEW.pid
                  || '), Value (Username) = (' || NEW.username || ')';
    RETURN NULL;
  END IF;

  IF NEW.study <> 'all' THEN
    -- Study must be a study.sid.
    PERFORM 1
      FROM study
      WHERE study.sid = NEW.study;
    IF NOT FOUND THEN
      RAISE EXCEPTION integrity_constraint_violation USING
            MESSAGE = 'Error on ' || TG_OP || ' of PERMISSION'
          , DETAIL = 'Key (Pid) = (' || NEW.pid
                   || '): Value (Username) = (' || NEW.username
                   || '): Value (Study) = (' || NEW.study
                   || '): PERMISSION.Study must be ''all'' '
                   || 'or a STUDY.SId value';
      RETURN NULL;
    END IF;
  END IF;

  -- Done with the validation.  Grant permissions to the table's sequences,
  -- or revoke them.
  IF TG_OP = 'INSERT' THEN
    EXECUTE 'GRANT SELECT '
              'ON SEQUENCE biography_bid_seq '
              'TO ' || NEW.username || ';';
    EXECUTE 'GRANT SELECT '
              'ON SEQUENCE fertility_fid_seq '
              'TO ' || NEW.username || ';';
    IF NEW.access <> 'search' THEN
      
      EXECUTE 'GRANT UPDATE '
                'ON SEQUENCE biography_bid_seq '
                'TO ' || NEW.username || ';';
      EXECUTE 'GRANT UPDATE '
                'ON SEQUENCE fertility_fid_seq '
                'TO ' || NEW.username || ';';
      EXECUTE 'GRANT USAGE '
                'ON SEQUENCE biography_bid_seq '
                'TO ' || NEW.username || ';';
      EXECUTE 'GRANT USAGE '
                'ON SEQUENCE fertility_fid_seq '
                'TO ' || NEW.username || ';';

    END IF;
  ELSE  -- TG_OP = 'UPDATE'
    -- UserName can't change, to make this easy.
    IF NEW.access = 'search' AND OLD.access <> 'search' THEN
      
      PERFORM 1
        FROM permission
        WHERE permission.username = OLD.username
              AND permission.access <> 'search';
      IF NOT FOUND THEN
        -- User has only search permission, if that.
        EXECUTE 'REVOKE UPDATE '
                  'ON SEQUENCE biography_bid_seq '
                  'FROM ' || OLD.username || ';';
        EXECUTE 'REVOKE UPDATE '
                  'ON SEQUENCE biography_bid_seq '
                  'FROM ' || OLD.username || ';';
        EXECUTE 'REVOKE USAGE '
                  'ON SEQUENCE biography_bid_seq '
                  'FROM ' || OLD.username || ';';
        EXECUTE 'REVOKE USAGE '
                  'ON SEQUENCE biography_bid_seq '
                  'FROM ' || OLD.username || ';';
      END IF;

    ELSIF OLD.access = 'search' AND NEW.access <> 'search' THEN
      -- Changing from search to something else.
      
      EXECUTE 'GRANT UPDATE '
                'ON SEQUENCE biography_bid_seq '
                'TO ' || NEW.username || ';';
      EXECUTE 'GRANT UPDATE '
                'ON SEQUENCE fertility_fid_seq '
                'TO ' || NEW.username || ';';
      EXECUTE 'GRANT USAGE '
                'ON SEQUENCE biography_bid_seq '
                'TO ' || NEW.username || ';';
      EXECUTE 'GRANT USAGE '
                'ON SEQUENCE fertility_fid_seq '
                'TO ' || NEW.username || ';';

    END IF;
  END IF;

  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.permission_func() OWNER TO plhdb_admin;

--
-- Name: probability_type_update_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.probability_type_update_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  BEGIN
  -- Function for probability_type update triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  -- Simpler than checking, when symmetrical becomes TRUE, for symmetry
  -- in BIOGRAPHY BirthDate, BDMin, and BDMax.
  
  IF NEW.Symmetrical <> OLD.Symmetrical THEN
    -- Symmetrical has changed
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on UPDATE of PROBABILITY_TYPES'
        , DETAIL =  'Value (Symmetrical) = (' || OLD.Symmetrical
                    || '): PROBABILITY_TYPES.Symmetrical cannot be changed';
    RETURN NULL;
  END IF;


  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.probability_type_update_func() OWNER TO plhdb_admin;

--
-- Name: start_event_update_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.start_event_update_func() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  BEGIN
  -- Function for start_event insert and update triggers
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  IF OLD.Initial <> NEW.initial
    AND NEW.Initial THEN
    -- Initial StartTypes mean StartDate = EntryDate.
    PERFORM 1
      FROM biography
           JOIN fertility AS ffi ON (ffi.bid = biography.bid)
      WHERE ffi.starttype = NEW.code
            AND biography.entrydate <> ffi.startdate;
    IF FOUND THEN
      RAISE EXCEPTION integrity_constraint_violation USING
            MESSAGE = 'Error on ' || TG_OP || ' of START_EVENT'
        , DETAIL = 'Key(Code) = (' || NEW.code
                   || '): Value (Initial) = (' || NEW.initial
                   || '): Cannot make Initial = TRUE; there is a related '
                   || 'FERTILITY row using this Code for '
                   || 'a StartType but it''s related BIOGRAPHY.EntryDate '
                   || 'is not the fertility interval StartDate';
    END IF;
  END IF;

  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.start_event_update_func() OWNER TO plhdb_admin;

--
-- Name: study_delete_func(); Type: FUNCTION; Schema: plhdb; Owner: plhdb_admin
--

CREATE FUNCTION plhdb.study_delete_func() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'plhdb', 'pg_temp'
    AS $$
  -- Function for study delete trigger
  --
  -- Copyright (C) 2016 The Meme Factory, Inc., http://www.meme.com/
  -- Distributed under the GNU General Public License, version 3 or later.

  DECLARE

  BEGIN

  PERFORM 1
    FROM permission
    WHERE permission.study = OLD.sid;
  IF FOUND THEN
    RAISE EXCEPTION integrity_constraint_violation USING
          MESSAGE = 'Error on ' || TG_OP || ' of STUDY'
        , DETAIL = 'Key (SId) = (' || OLD.sid
                   || '): PERMISSION rows exist with Study values '
                   || 'which reference this STUDY.SId';
    RETURN NULL;
  END IF;

  RETURN NULL;
  END;
$$;


ALTER FUNCTION plhdb.study_delete_func() OWNER TO plhdb_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

-- --
-- -- Name: cond_kids; Type: TABLE; Schema: mez9; Owner: mez9
-- --

-- CREATE TABLE mez9.cond_kids (
--     kid_name character(100) NOT NULL,
--     kid_birth date NOT NULL,
--     kid_mom character(100) NOT NULL,
--     kid_bid integer NOT NULL
-- );


-- ALTER TABLE mez9.cond_kids OWNER TO mez9;

-- --
-- -- Name: cond_kids_parity; Type: TABLE; Schema: mez9; Owner: mez9
-- --

-- CREATE TABLE mez9.cond_kids_parity (
--     studyid character(12) NOT NULL,
--     animid character(20) NOT NULL
-- );


-- ALTER TABLE mez9.cond_kids_parity OWNER TO mez9;

-- --
-- -- Name: access_groups; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
-- --

CREATE VIEW plhdb.access_groups AS
 SELECT pg_roles.rolname AS groupname,
    pg_shdescription.description
   FROM (pg_roles
     LEFT JOIN pg_shdescription ON ((pg_shdescription.objoid = pg_roles.oid)))
  WHERE (NOT pg_roles.rolcanlogin);


ALTER TABLE plhdb.access_groups OWNER TO plhdb_admin;

--
-- Name: VIEW access_groups; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON VIEW plhdb.access_groups IS 'One row per PostgreSQL role which cannot login.  These roles are used
to grant PostgreSQL level permissions.';


--
-- Name: COLUMN access_groups.groupname; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.access_groups.groupname IS 'The name of the group.';


--
-- Name: COLUMN access_groups.description; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.access_groups.description IS 'A description of the purpose of the group.';


--
-- Name: accounts; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
--

CREATE VIEW plhdb.accounts AS
 SELECT pg_roles.rolname AS username,
    pg_shdescription.description
   FROM (pg_roles
     LEFT JOIN pg_shdescription ON ((pg_shdescription.objoid = pg_roles.oid)))
  WHERE pg_roles.rolcanlogin;


ALTER TABLE plhdb.accounts OWNER TO plhdb_admin;

--
-- Name: VIEW accounts; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON VIEW plhdb.accounts IS 'One row per PostgreSQL role which can login.  The purpose of this
view is to provide a description of accounts.';


--
-- Name: COLUMN accounts.username; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.accounts.username IS 'The login name.';


--
-- Name: COLUMN accounts.description; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.accounts.description IS 'The comment supplied upon account creation which purportedly
describes the account.';


--
-- Name: biography; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.biography (
    bid integer NOT NULL,
    studyid character varying(12) NOT NULL,
    animid character varying(16) NOT NULL,
    animname character varying(128),
    momonly boolean NOT NULL,
    birthdate date,
    bdmin date,
    bdmax date,
    bddist character(1),
    birthgroup character varying(32),
    bgqual character(1),
    firstborn character(1),
    mombid integer,
    sex character(1) NOT NULL,
    entrydate date,
    entrytype character varying(8),
    departdate date,
    departtype character varying(8),
    departdateerror double precision,
    CONSTRAINT "AnimId: Cannot be empty or only whitespace characters" CHECK ((btrim((animid)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "AnimId: Cannot begin or end with spaces" CHECK ((((animid)::text !~ '$ '::text) AND ((animid)::text !~ ' $'::text))),
    CONSTRAINT "AnimId: Cannot contain non-single-space whitespace" CHECK (((animid IS NULL) OR ((animid)::text !~ '[
	]'::text))),
    CONSTRAINT "AnimName: Cannot be empty or only whitespace characters" CHECK ((btrim((animname)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "AnimName: Cannot begin or end with spaces" CHECK ((((animname)::text !~ '$ '::text) AND ((animname)::text !~ ' $'::text))),
    CONSTRAINT "AnimName: Cannot contain non-single-space whitespace" CHECK (((animname IS NULL) OR ((animname)::text !~ '[
	]'::text))),
    CONSTRAINT "BDDist cannot be NULL unless MomOnly is TRUE" CHECK ((momonly OR ((NOT momonly) AND (bddist IS NOT NULL)))),
    CONSTRAINT "BDMax cannot be NULL unless MomOnly is TRUE" CHECK ((momonly OR ((NOT momonly) AND (bdmax IS NOT NULL)))),
    CONSTRAINT "BDMax must be <= DepartDate plus DepartDateError years" CHECK ((bdmax <= (departdate + (ceil((COALESCE(departdateerror, (0)::double precision) * '365.25'::double precision)))::integer))),
    CONSTRAINT "BDMin cannot be NULL unless MomOnly is TRUE" CHECK ((momonly OR ((NOT momonly) AND (bdmin IS NOT NULL)))),
    CONSTRAINT "BDMin must be <= BirthDate" CHECK ((bdmin <= birthdate)),
    CONSTRAINT "BGQual is NULL or one of C or U" CHECK (((bgqual IS NULL) OR ((bgqual IS NOT NULL) AND ((bgqual = 'C'::bpchar) OR (bgqual = 'U'::bpchar))))),
    CONSTRAINT "BirthDate cannot be NULL unless MomOnly is TRUE" CHECK ((momonly OR ((NOT momonly) AND (birthdate IS NOT NULL)))),
    CONSTRAINT "BirthDate must be <= EntryDate" CHECK ((birthdate <= entrydate)),
    CONSTRAINT "BirthDate must be >= 1910-01-01" CHECK (('1910-01-01'::date <= birthdate)),
    CONSTRAINT "BirthGroup: Cannot be empty or only whitespace characters" CHECK ((btrim((birthgroup)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "BirthGroup: Cannot begin or end with spaces" CHECK ((((birthgroup)::text !~ '$ '::text) AND ((birthgroup)::text !~ ' $'::text))),
    CONSTRAINT "BirthGroup: Cannot contain non-single-space whitespace" CHECK (((birthgroup IS NULL) OR ((birthgroup)::text !~ '[
	]'::text))),
    CONSTRAINT "Birthdate must be <= BDMax" CHECK ((birthdate <= bdmax)),
    CONSTRAINT "DepartDate cannot be NULL unless MomOnly is TRUE" CHECK ((momonly OR ((NOT momonly) AND (departdate IS NOT NULL)))),
    CONSTRAINT "DepartDate must be on or precede today's date" CHECK ((departdate <= CURRENT_DATE)),
    CONSTRAINT "DepartDateError must be >= 0" CHECK ((departdateerror >= (0)::double precision)),
    CONSTRAINT "DepartDateError must be NULL when DepartDate is NULL" CHECK ((NOT ((departdate IS NULL) AND (departdateerror IS NOT NULL)))),
    CONSTRAINT "DepartType can be NULL only when DepartDate is NULL" CHECK (((departdate IS NULL) OR (departtype IS NOT NULL))),
    CONSTRAINT "EntryDate cannot be NULL unless MomOnly is TRUE" CHECK ((momonly OR ((NOT momonly) AND (entrydate IS NOT NULL)))),
    CONSTRAINT "EntryDate must be <= DepartDate" CHECK ((entrydate <= departdate)),
    CONSTRAINT "EntryDate must be on or follow 1960-01-01" CHECK (('1960-01-01'::date <= entrydate)),
    CONSTRAINT "EntryDate must be on or precede today's date" CHECK ((entrydate <= CURRENT_DATE)),
    CONSTRAINT "EntryType can be NULL only when EntryDate is NULL" CHECK (((entrydate IS NULL) OR (entrytype IS NOT NULL))),
    CONSTRAINT "EntryType cannot be NULL unless MomOnly is TRUE" CHECK ((momonly OR ((NOT momonly) AND (entrytype IS NOT NULL)))),
    CONSTRAINT "FirstBorn is NULL or one of: Y, N, U" CHECK (((firstborn IS NULL) OR ((firstborn IS NOT NULL) AND ((firstborn = 'Y'::bpchar) OR (firstborn = 'N'::bpchar) OR (firstborn = 'U'::bpchar))))),
    CONSTRAINT "Sex must be = 'F' when MomOnly = TRUE" CHECK (((NOT momonly) OR (sex = 'F'::bpchar))),
    CONSTRAINT "Sex one of: M, F, U" CHECK (((sex = 'M'::bpchar) OR (sex = 'F'::bpchar) OR (sex = 'U'::bpchar))),
    CONSTRAINT "The MomBId value cannot be the BId value" CHECK ((mombid <> bid))
);


ALTER TABLE plhdb.biography OWNER TO plhdb_admin;

--
-- Name: TABLE biography; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.biography IS 'One row per individual studied.  These individuals are those which
are the subject of observation, such as the animals in an animal life
history study. At present, animals can be the subject of only one
study; in the future this restriction may need to be lifted. Also,
birth groups are recorded directly as an attribute, and hence are
denormalized, but at present it is unclear which attributes other than
a name a birth group would need to have.

Access to rows in BIOGRAPHY is controlled, on a per-study basis, by the
PERMISSION table.

AnimId must be unique per StudyId.
AnimName must either be NULL or unique per StudyId.
BirthDate must be on or precede EntryDate.
BirthDate may be NULL only when MomOnly is TRUE.
BDMin must be NULL or on or precede BirthDate.
BDMin may be NULL only when MomOnly is TRUE.
BDMax must be NULL or on or follow BirthDate.
BDMax may be NULL only when MomOnly is TRUE.
BDMax may not follow the sum DepartDate plus DepartDateError number
  of years.
BDDist may be NULL only when MomOnly is TRUE.
The MomBId value cannot be the Bid value.
Sex must be ''F'' when MomOnly is TRUE.
Entrydate must be on or precede DepartDate.
EntryDate may be NULL only when MomOnly is TRUE.
EntryDate may be NULL only when MomOnly is TRUE.
EntryType can be NULL only when EntryDate is also NULL.
DepartDate may be NULL only when MomOnly is TRUE.
DepartType can be NULL only when DepartDate is also NULL.
DepartDateError must be NULL if DepartDate is NULL.

The combination of StudyId and AnimId must be unique.  Because neither
of these columns may be NULL this combination can, instead of the Bid
value, be used as a unique row identifier.

The combination of StudyId and AnimName must be unique.  Because
AnimName may be NULL this combination cannot be used as a unique row
identifier.

Individuals identified as mothers (rows that have a BId value in the
MomBId column of another BIOGRAPHY row) must have a ''F''
value for Sex.  Mothers and their offspring must have the same StudyId
value.  These conditions are checked upon transaction commit.

TIP: Use the BIOGRAPHIES view to get the mother''s AnimId.
BIOGRAPHIES is identical to this table but for the additional
column.';


--
-- Name: COLUMN biography.bid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.bid IS 'Unique row identifier, and hence a unique identifier of the individual
regardless of study.  The value of this column is automatically
assigned by the system; the normal practice, which results in a system
generated id, is to omit this column when inserting new rows or to
supply a NULL value.  The value of this column cannot be NULL.  The
value of this column cannot be changed.

TIP: Can be used to JOIN with FERTILITY.BId.';


--
-- Name: COLUMN biography.studyid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.studyid IS 'Identifier of the study for which the individual is observed.  This
value may not be NULL.

TIP: Can be used to JOIN with STUDY.Id.';


--
-- Name: COLUMN biography.animid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.animid IS 'The identifier used by the study to denote the individual.  This
value may not be NULL.';


--
-- Name: COLUMN biography.animname; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.animname IS 'The (long) name of the individual.  This value may be NULL when the
individual has no long name.';


--
-- Name: COLUMN biography.momonly; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.momonly IS 'Whether or not the biography row records an individual who exists in
the database only because they are known to be a mother of another
individual in the database.  A Boolean value.  Individuals who are
"only mothers" (MomOnly = TRUE) have different requirements from
typical study subjects as to what data must or must not be recorded in
the database.  This value may not be NULL.';


--
-- Name: COLUMN biography.birthdate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.birthdate IS 'Birth date. Animal''s birthdate. The birthdate is either the exactly
known date of birth or it is with a range of possible birthdates.

The BirthDate must be on or follow 1910-01-01.

Caution: The automatic data integrity check for early BirthDates does
not provide adequate per-study data integrity.';


--
-- Name: COLUMN biography.bdmin; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.bdmin IS 'Estimated earliest birth date. Must differ from Birthdate whenever
earliest possible birth date is >7 days before Birthdate.';


--
-- Name: COLUMN biography.bdmax; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.bdmax IS 'Estimated latest birth date.  Must differ from Birthdate whenever
latest possible birth date is >7 days after Birthdate.';


--
-- Name: COLUMN biography.bddist; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.bddist IS 'Probability distribution of the estimated birth date given BDMin,
Birthdate, and BDMax.  The vocabulary for this column is defined by
the PROBABILITY_TYPE table, which expected to define only normal (N)
and uniform (U).';


--
-- Name: COLUMN biography.birthgroup; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.birthgroup IS 'The name or code or ID of the group within which the individual was
born.  This value may be NULL to indicate that the group at birth is
unknown or the concept is not applicable.

Caution: This value is not validated.  As with all strings, it is
case-sensitive.';


--
-- Name: COLUMN biography.bgqual; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.bgqual IS 'Quality of the estimate of the group of birth.  The degree of
certainty about which group this animal was born into.  Must be one of
''C'' or ''U'' for certain or uncertain.
This value may be NULL to indicate quality estimate is unknown.';


--
-- Name: COLUMN biography.firstborn; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.firstborn IS 'Whether the individual is the first born, meaning the first offspring
from the maternal parent. Values are ''Y'', ''N'' and
''U'', for Yes, No, and Unknown, respectively.  This value
may be NULL when the study does not track first born.';


--
-- Name: COLUMN biography.mombid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.mombid IS 'The row identifier of the individual''s mother.  This is a
BIOGRAPHY.BId value.  This condition is checked on transaction commit.
This value may be NULL when the mother is unknown.

TIP: The study''s code for the mother may be found in the MomId
column of the BIOGRAPHIES view.';


--
-- Name: COLUMN biography.sex; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.sex IS 'The gender of the individual. Allowed values are ''M'',
''F'', and ''U'', for male, female, and unknown,
respectively.  This value may not be NULL.';


--
-- Name: COLUMN biography.entrydate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.entrydate IS 'Date the animal was first seen. Date on which the animal is first
sighted in the study population, either because the animal is
recognized and ID''d as of that date or because strong inference
indicates group membership from that date. Study population is the
studied population at the time of the animal''s entry into it.

EntryDate must be on or follow 1960-01-01.
EntryDate must be on or precede today''s date.

Caution: The automatic data integrity check for early EntryDates does
not provide adequate per-study data integrity.';


--
-- Name: COLUMN biography.entrytype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.entrytype IS 'Type of entry into population. Birth, immigration, start of confirmed
ID, Initiation of close observation for any other reason, etc.  The
vocabulary for this column is defined by the START_EVENT table.';


--
-- Name: COLUMN biography.departdate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.departdate IS 'Date on which the animal was last seen alive in the population.
DepartDate must be on or precede today''s date.';


--
-- Name: COLUMN biography.departtype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.departtype IS 'Type of departure.  Death, permanent disappearance, emigration out of
the study population, end of close observation for any other reason,
or end of currently entered data period.  Death may be assigned only
in cases where the evidence is very strong: body found, or
circumstantial evidence indicates poor health or other risks
contributing to mortality and/or violations of population-specific
behavior patterns. Otherwise assign permanent disappearance. Do not
assign mortality based solely on inferred risks associated with age.
The vocabulary for this column is defined by the END_EVENT table.';


--
-- Name: COLUMN biography.departdateerror; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biography.departdateerror IS 'Time between departdate and the first time that the animal was
confirmed missing.  Expressed as fraction of a year (number of days
divided by 365.25).  Assign a zero to DepartdateError only if
the number of day between departdate and the first time that the animal
was confirmed missing was < 15.';


--
-- Name: biographies; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
--

CREATE VIEW plhdb.biographies WITH (security_barrier='on') AS
 SELECT offspring.bid,
    offspring.studyid,
    offspring.animid,
    offspring.animname,
    offspring.momonly,
    offspring.birthdate,
    offspring.bdmin,
    offspring.bdmax,
    offspring.bddist,
    offspring.birthgroup,
    offspring.bgqual,
    offspring.firstborn,
    offspring.mombid,
    mom.animid AS momid,
    offspring.sex,
    offspring.entrydate,
    offspring.entrytype,
    offspring.departdate,
    offspring.departtype,
    offspring.departdateerror
   FROM (plhdb.biography offspring
     LEFT JOIN plhdb.biography mom ON ((mom.bid = offspring.mombid)))
  WHERE plhdb.biography_search_access(offspring.studyid);


ALTER TABLE plhdb.biographies OWNER TO plhdb_admin;

--
-- Name: VIEW biographies; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON VIEW plhdb.biographies IS 'One row per individual studied.  This view is identical to the
BIOGRAPHY table, but for the addition of the MomId column -- which
contains the mother''s AnimId.

This view is updatable.  The underlying rows may be changed by INSERT,
UPDATE, or DELETE on the view.

The MomBId value of the underlying BIOGRAPHY row may be manipulated via
BIOGRAPHIES using either the MomBId column or the MomId column.  On
INSERT either MomBId or MomId can be omitted from the list of inserted
columns or the NULL value used in either of the columns.  The MomId of
the underlying BIOGRAPHIES row is assigned based on the supplied
non-NULL column.  To INSERT a NULL BIOGRAPHY.MomBId value either
specify a NULL value for both BIOGRAPHIES MomBId and MomId or omit both
columns from the INSERT statement.  On INSERT if both MomBId and MomId
are specified then the 2 values must refer to the same mother.  On
UPDATE if both MomBId and MomId change then the 2 values must refer to
the same mother; if only one of MomBId or MomId changes value then the
changed value is used.

For more information see the BIOGRAPHY table documentation.';


--
-- Name: COLUMN biographies.bid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.bid IS 'Unique row identifier, and hence a unique identifier of the individual
regardless of study.  The value of this column is automatically
assigned by the system; the normal practice, which results in a system
generated id, is to omit this column when inserting new rows or to
supply a NULL value.  The value of this column cannot be NULL.  The
value of this column cannot be changed.

TIP: Can be used to JOIN with FERTILITY.BId.';


--
-- Name: COLUMN biographies.studyid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.studyid IS 'Identifier of the study for which the individual is observed.  This
value may not be NULL.

TIP: Can be used to JOIN with STUDY.Id.';


--
-- Name: COLUMN biographies.animid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.animid IS 'The identifier used by the study to denote the individual.  This
value may not be NULL.';


--
-- Name: COLUMN biographies.animname; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.animname IS 'The (long) name of the individual.  This value may be NULL when the
individual has no long name.';


--
-- Name: COLUMN biographies.momonly; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.momonly IS 'Whether or not the biography row records an individual who exists in
the database only because they are known to be a mother of another
individual in the database.  A Boolean value.  Individuals who are
"only mothers" (MomOnly = TRUE) have different requirements from
typical study subjects as to what data must or must not be recorded in
the database.  This value may not be NULL.';


--
-- Name: COLUMN biographies.birthdate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.birthdate IS 'Birth date. Animal''s birthdate. The birthdate is either the exactly
known date of birth or it is with a range of possible birthdates.

The BirthDate must be on or follow 1910-01-01.

Caution: The automatic data integrity check for early BirthDates does
not provide adequate per-study data integrity.';


--
-- Name: COLUMN biographies.bdmin; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.bdmin IS 'Estimated earliest birth date. Must differ from Birthdate whenever
earliest possible birth date is >7 days before Birthdate.';


--
-- Name: COLUMN biographies.bdmax; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.bdmax IS 'Estimated latest birth date.  Must differ from Birthdate whenever
latest possible birth date is >7 days after Birthdate.';


--
-- Name: COLUMN biographies.bddist; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.bddist IS 'Probability distribution of the estimated birth date given BDMin,
Birthdate, and BDMax.  The vocabulary for this column is defined by
the PROBABILITY_TYPE table, which expected to define only normal (N)
and uniform (U).';


--
-- Name: COLUMN biographies.birthgroup; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.birthgroup IS 'The name or code or ID of the group within which the individual was
born.  This value may be NULL to indicate that the group at birth is
unknown or the concept is not applicable.

Caution: This value is not validated.  As with all strings, it is
case-sensitive.';


--
-- Name: COLUMN biographies.bgqual; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.bgqual IS 'Quality of the estimate of the group of birth.  The degree of
certainty about which group this animal was born into.  Must be one of
''C'' or ''U'' for certain or uncertain.
This value may be NULL to indicate quality estimate is unknown.';


--
-- Name: COLUMN biographies.firstborn; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.firstborn IS 'Whether the individual is the first born, meaning the first offspring
from the maternal parent. Values are ''Y'', ''N'' and
''U'', for Yes, No, and Unknown, respectively.  This value
may be NULL when the study does not track first born.';


--
-- Name: COLUMN biographies.mombid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.mombid IS 'The row identifier of the individual''s mother.  This is a
BIOGRAPHY.BId value.  This condition is checked on transaction commit.
This value may be NULL when the mother is unknown.

TIP: The study''s code for the mother may be found in the MomId
column of the BIOGRAPHIES view.';


--
-- Name: COLUMN biographies.momid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.momid IS 'The identifier used by the study to denote the indivdual''s mother.
This value may be NULL when the mother is unknown.';


--
-- Name: COLUMN biographies.sex; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.sex IS 'The gender of the individual. Allowed values are ''M'',
''F'', and ''U'', for male, female, and unknown,
respectively.  This value may not be NULL.';


--
-- Name: COLUMN biographies.entrydate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.entrydate IS 'Date the animal was first seen. Date on which the animal is first
sighted in the study population, either because the animal is
recognized and ID''d as of that date or because strong inference
indicates group membership from that date. Study population is the
studied population at the time of the animal''s entry into it.

EntryDate must be on or follow 1960-01-01.
EntryDate must be on or precede today''s date.

Caution: The automatic data integrity check for early EntryDates does
not provide adequate per-study data integrity.';


--
-- Name: COLUMN biographies.entrytype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.entrytype IS 'Type of entry into population. Birth, immigration, start of confirmed
ID, Initiation of close observation for any other reason, etc.  The
vocabulary for this column is defined by the START_EVENT table.';


--
-- Name: COLUMN biographies.departdate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.departdate IS 'Date on which the animal was last seen alive in the population.
DepartDate must be on or precede today''s date.';


--
-- Name: COLUMN biographies.departtype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.departtype IS 'Type of departure.  Death, permanent disappearance, emigration out of
the study population, end of close observation for any other reason,
or end of currently entered data period.  Death may be assigned only
in cases where the evidence is very strong: body found, or
circumstantial evidence indicates poor health or other risks
contributing to mortality and/or violations of population-specific
behavior patterns. Otherwise assign permanent disappearance. Do not
assign mortality based solely on inferred risks associated with age.
The vocabulary for this column is defined by the END_EVENT table.';


--
-- Name: COLUMN biographies.departdateerror; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.biographies.departdateerror IS 'Time between departdate and the first time that the animal was
confirmed missing.  Expressed as fraction of a year (number of days
divided by 365.25).  Assign a zero to DepartdateError only if
the number of day between departdate and the first time that the animal
was confirmed missing was < 15.';


--
-- Name: biography_bid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.biography_bid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.biography_bid_seq OWNER TO plhdb_admin;

--
-- Name: biography_bid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.biography_bid_seq OWNED BY plhdb.biography.bid;


--
-- Name: end_event; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.end_event (
    code character(1) NOT NULL,
    description character varying(64) NOT NULL,
    final boolean NOT NULL,
    CONSTRAINT "Code: Cannot be empty or only whitespace characters" CHECK ((btrim((code)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Code: Cannot begin or end with spaces" CHECK (((code !~ '$ '::text) AND (code !~ ' $'::text))),
    CONSTRAINT "Code: Cannot contain non-single-space whitespace" CHECK (((code IS NULL) OR (code !~ '[
	]'::text))),
    CONSTRAINT "Description: Cannot be empty or only whitespace characters" CHECK ((btrim((description)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Description: Cannot begin or end with spaces" CHECK ((((description)::text !~ '$ '::text) AND ((description)::text !~ ' $'::text))),
    CONSTRAINT "Description: Cannot contain non-single-space whitespace" CHECK (((description IS NULL) OR ((description)::text !~ '[
	]'::text)))
);


ALTER TABLE plhdb.end_event OWNER TO plhdb_admin;

--
-- Name: TABLE end_event; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.end_event IS 'One row per kind of event which ends the interval of time during which
the lives of study individuals are tracked.  This table establishes
a controlled vocabulary for the events which mark the end of
observation.';


--
-- Name: COLUMN end_event.code; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.end_event.code IS 'A unique single character code for the end of observation type.  This
code identifies the row within the database.';


--
-- Name: COLUMN end_event.description; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.end_event.description IS 'A unique description of the end of observation type.';


--
-- Name: COLUMN end_event.final; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.end_event.final IS 'A boolean value.  When TRUE indicates that no other events may follow.
Death is an example end event where Final should be TRUE.

This flag may impose additional requirements; this is dependent upon
the table referencing the END_EVENT row.  For more information see the
documentation of each table which uses END_EVENT for vocabulary
control.

The value of this column may not be NULL.';


--
-- Name: fertility; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.fertility (
    fid integer NOT NULL,
    bid integer NOT NULL,
    startdate date NOT NULL,
    starttype character(1) NOT NULL,
    stopdate date NOT NULL,
    stoptype character(1) NOT NULL,
    CONSTRAINT "StartDate must be <= StopDate" CHECK ((startdate <= stopdate))
);


ALTER TABLE plhdb.fertility OWNER TO plhdb_admin;

--
-- Name: TABLE fertility; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.fertility IS 'One row per uninterrupted period of observation on a female; during
which no possible births would have been missed.

Access to rows in FERTILITY is controlled, on a per-study basis, by the
PERMISSION table.

Per individual, fertility intervals may not overlap.
StartDate must be on or precede StopDate.

Only BIOGRAPHY rows with Sex = ''F'' may have related female
fertility interval rows.

FERTILITY rows may be related only to those BIOGRAPHY
rows which have a FALSE MomOnly value.

The StartDate cannot precede the EntryDate of the related BIOGRAPHY
row.

The StopDate cannot follow the date from the related individual''s
BIOGRAPHY row given by the formula (DepartDate plus (DepartDateError
number of years)).

Rows with a StartDate which matches the related BIOGRAPHY row''s
EntryDate must have a StartType value which is that of the related
BIOGRAPHY row''s EntryType.  This condition is checked on transaction
commit.

Rows with a StopDate which matches the related BIOGRAPHY row''s
DepartDate must have a StopType value which is that of the related
BIOGRAPHY row''s DepartType.  This condition is checked on transaction
commit.

Rows with a StartType flagged as Initial on the START_EVENT table must
have a StartDate equal to the related BIOGRAPHY row''s EntryDate.  This
condition is checked on transaction commit, except in the case where
START_EVENT.Initial is altered.

Rows with a StopType flagged as Final on the END_EVENT table must have
a StopDate equal to the related BIOGRAPHY row''s DepartDate.  This
condition is checked on transaction commit, except in the case where
END_EVENT.Final is altered.

TIP: Use the FERTILITIES view to see AnimId and StudyId columns.
FERTILITIES is identical to this table but for the additional
columns.';


--
-- Name: COLUMN fertility.fid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertility.fid IS 'Unique row identifier, and hence the unique identifier of the female
fertility interval.  The value of this column is automatically
assigned by the system; the normal practice, which results in a system
generated id, is to omit this column when inserting new rows or to
supply a NULL value.  The value of this column cannot be NULL.  The
value of this column cannot be changed.';


--
-- Name: COLUMN fertility.bid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertility.bid IS 'Unique identifier of the individual for which the row records a
fertility interval.

TIP: Can be used to JOIN with BIOGRAPHY.BId.';


--
-- Name: COLUMN fertility.startdate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertility.startdate IS 'Startdate for fertility surveillance.  Date on which surveillance of
fertility began.  This date must not have error associated with
it. These dates are conservative: if you are sure that you know about
her starting on July 15 but you MIGHT know about her starting on July
1, you must choose the more conservative date, which is July 15.  This
value may not be NULL.';


--
-- Name: COLUMN fertility.starttype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertility.starttype IS 'Reason for the start of surveillance. The vocabulary for this column
is defined by the START_EVENT table.  This value may not be NULL.';


--
-- Name: COLUMN fertility.stopdate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertility.stopdate IS 'Stopdate for fertility surveillance.  Date on which surveillance of
fertility ended.  Surveillance ends when you stop seeing the animal for
a long enough period of time that births could be missed.  This date
must not have error associated with it. These dates are conservative:
if you are sure that you know about her until July 1 but you MIGHT know
about her until July 15, you must choose the more conservative date
which is July 1.  This value may not be NULL.';


--
-- Name: COLUMN fertility.stoptype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertility.stoptype IS 'Cause of the end of surveillance. The vocabulary for this column is
defined by the END_EVENT table.  This value may not be NULL.';


--
-- Name: fertilities; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
--

CREATE VIEW plhdb.fertilities WITH (security_barrier='on') AS
 SELECT fertility.fid,
    fertility.bid,
    biography.studyid,
    biography.animid,
    fertility.startdate,
    fertility.starttype,
    fertility.stopdate,
    fertility.stoptype
   FROM (plhdb.fertility
     JOIN plhdb.biography ON ((biography.bid = fertility.bid)))
  WHERE plhdb.biography_search_access(biography.studyid);


ALTER TABLE plhdb.fertilities OWNER TO plhdb_admin;

--
-- Name: VIEW fertilities; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON VIEW plhdb.fertilities IS 'One row per uninterrupted period of observation on a female; during
which no possible births would have been missed.  This view is
identical to the FERTILITY table, but for the addition of the StudyId
and AnimId columns.

This view is updatable.  The underlying rows may be changed by INSERT,
UPDATE, or DELETE on the view.

The BId value of the underlying FERTILITY row may be manipulated via
FERTILITIES using either the BId column or the AnimId and StudyId
column combination.  On INSERT either BId or the AnimId/StudyId pair
can be omitted from the list of inserted columns or the NULL value used
in either Bid or the AnimId/StudyId pair.  The BId of the underlying
FERTILITIES row is assigned based on the supplied non-NULL value(s).
On INSERT if both the BId and AnimId/StudyId pair are specified then
the 2 values must refer to the same mother.  On UPDATE if both the BId
and the AnimId/StudyId pair change then the values must refer to the
same mother; if only one of the BId or the AnimId/StudyId pair changes
then the changed value(s) is(are) used.

For more information see the FERTILITY table documentation.';


--
-- Name: COLUMN fertilities.fid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertilities.fid IS 'Unique row identifier, and hence the unique identifier of the female
fertility interval.  The value of this column is automatically
assigned by the system; the normal practice, which results in a system
generated id, is to omit this column when inserting new rows or to
supply a NULL value.  The value of this column cannot be NULL.  The
value of this column cannot be changed.';


--
-- Name: COLUMN fertilities.bid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertilities.bid IS 'Unique identifier of the individual for which the row records a
fertility interval.

TIP: Can be used to JOIN with BIOGRAPHY.BId.';


--
-- Name: COLUMN fertilities.studyid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertilities.studyid IS 'Identifier of the study for which the individual is observed.  This
value may not be NULL.

TIP: Can be used to JOIN with STUDY.Id.';


--
-- Name: COLUMN fertilities.animid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertilities.animid IS 'The identifier used by the study to denote the individual.  This value
may not be NULL.';


--
-- Name: COLUMN fertilities.startdate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertilities.startdate IS 'Startdate for fertility surveillance.  Date on which surveillance of
fertility began.  This date must not have error associated with
it. These dates are conservative: if you are sure that you know about
her starting on July 15 but you MIGHT know about her starting on July
1, you must choose the more conservative date, which is July 15.  This
value may not be NULL.';


--
-- Name: COLUMN fertilities.starttype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertilities.starttype IS 'Reason for the start of surveillance. The vocabulary for this column
is defined by the START_EVENT table.  This value may not be NULL.';


--
-- Name: COLUMN fertilities.stopdate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertilities.stopdate IS 'Stopdate for fertility surveillance.  Date on which surveillance of
fertility ended.  Surveillance ends when you stop seeing the animal for
a long enough period of time that births could be missed.  This date
must not have error associated with it. These dates are conservative:
if you are sure that you know about her until July 1 but you MIGHT know
about her until July 15, you must choose the more conservative date
which is July 1.  This value may not be NULL.';


--
-- Name: COLUMN fertilities.stoptype; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.fertilities.stoptype IS 'Cause of the end of surveillance. The vocabulary for this column is
defined by the END_EVENT table.  This value may not be NULL.';


--
-- Name: fertility_fid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.fertility_fid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.fertility_fid_seq OWNER TO plhdb_admin;

--
-- Name: fertility_fid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.fertility_fid_seq OWNED BY plhdb.fertility.fid;


--
-- Name: permission; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.permission (
    pid integer NOT NULL,
    access character varying(10) NOT NULL,
    study character varying(12) NOT NULL,
    username name NOT NULL,
    CONSTRAINT "Access must be one of search, insert, edit, all" CHECK ((((access)::text = 'search'::text) OR ((access)::text = 'insert'::text) OR ((access)::text = 'edit'::text) OR ((access)::text = 'all'::text)))
);


ALTER TABLE plhdb.permission OWNER TO plhdb_admin;

--
-- Name: TABLE permission; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.permission IS 'Contains at most one row per user per study, each row defining the
PLHDB permission level the study grants to the user.  PLHDB
permissions apply only to PLHDB manager and user accounts, and
managers may change any of them.  When a user has no row for a study
the user has no permissions to the study.  The combination of study
and username must be unique.  When study is ''all'' the
username must be unique.

Adding a row to PERMISSION can only increase a user''s access.
Permission is never taken away.  So, in case of conflict between
permission granted to all studies and permission granted to a specific
study the user has the more permissive of the two.

TIP: The contents of this table is accessible only to administrator
and PLHDB manager accounts; use the PERMISSIONS view instead.';


--
-- Name: COLUMN permission.pid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.permission.pid IS 'Unique row identifier.  The value of this column is automatically
assigned by the system; the normal practice, which results in a system
generated id, is to omit this column when inserting new rows or to
supply a NULL value.  The value of this column cannot be NULL.';


--
-- Name: COLUMN permission.access; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.permission.access IS 'The type of access granted.  Must be one of:

  search
    = Can read study data;

  insert
    = search permissions + Can create new rows;

  edit
    = insert permissions + Can alter existing rows;

  all
    = edit permissions + Can delete existing rows.';


--
-- Name: COLUMN permission.study; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.permission.study IS 'The STUDY.Name of the study to which permission is granted or
''all'' if permission is granted to all studies.';


--
-- Name: COLUMN permission.username; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.permission.username IS 'The ROLE.rolname of the user to which permission is granted.  The
value of this column cannot be changed.

HINT: See the "accounts" view for information on users.';


--
-- Name: permission_pid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.permission_pid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.permission_pid_seq OWNER TO plhdb_admin;

--
-- Name: permission_pid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.permission_pid_seq OWNED BY plhdb.permission.pid;


--
-- Name: permissions; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
--

CREATE VIEW plhdb.permissions AS
 WITH user_permissions AS (
         SELECT permission_1.study
           FROM plhdb.permission permission_1
          WHERE (permission_1.username = CURRENT_USER)
        )
 SELECT permission.pid,
    permission.username,
    permission.study,
    permission.access
   FROM plhdb.permission
  WHERE (plhdb.is_superuser() OR ((EXISTS ( SELECT 1
           FROM user_permissions)) AND ((EXISTS ( SELECT 1
           FROM user_permissions
          WHERE ((user_permissions.study)::text = 'all'::text))) OR ((permission.study)::text = 'all'::text) OR (EXISTS ( SELECT 1
           FROM user_permissions
          WHERE ((permission.study)::text = (user_permissions.study)::text))))));


ALTER TABLE plhdb.permissions OWNER TO plhdb_admin;

--
-- Name: VIEW permissions; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON VIEW plhdb.permissions IS 'Contains at most one row per user per study, each row defining the
PLHDB permission level the study grants to the user.  Users are
allowed to see only permissions to those studies to which the user has
access.

HINT: The contents of the underlying PERMISSION table is available in
an unfiltered form to PLHDB manager accounts.

HINT: See also the ACCOUNTS and ACCESS_GROUPS views.';


--
-- Name: COLUMN permissions.pid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.permissions.pid IS 'Unique row identifier.  The value of this column is automatically
assigned by the system; the normal practice, which results in a system
generated id, is to omit this column when inserting new rows or to
supply a NULL value.  The value of this column cannot be NULL.';


--
-- Name: COLUMN permissions.username; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.permissions.username IS 'The ROLE.rolname of the user to which permission is granted.  The
value of this column cannot be changed.

HINT: See the "accounts" view for information on users.';


--
-- Name: COLUMN permissions.study; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.permissions.study IS 'The STUDY.Name of the study to which permission is granted or
''all'' if permission is granted to all studies.';


--
-- Name: COLUMN permissions.access; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.permissions.access IS 'The type of access granted.  Must be one of:

  search
    = Can read study data;

  insert
    = search permissions + Can create new rows;

  edit
    = insert permissions + Can alter existing rows;

  all
    = edit permissions + Can delete existing rows.';


--
-- Name: probability_type; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.probability_type (
    code character(1) NOT NULL,
    description text NOT NULL,
    symmetrical boolean NOT NULL,
    CONSTRAINT "Code: Cannot be empty or only whitespace characters" CHECK ((btrim((code)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Code: Cannot begin or end with spaces" CHECK (((code !~ '$ '::text) AND (code !~ ' $'::text))),
    CONSTRAINT "Code: Cannot contain non-single-space whitespace" CHECK (((code IS NULL) OR (code !~ '[
	]'::text))),
    CONSTRAINT "Description: Cannot be empty or only whitespace characters" CHECK ((btrim(description, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Description: Cannot begin or end with spaces" CHECK (((description !~ '$ '::text) AND (description !~ ' $'::text))),
    CONSTRAINT "Description: Cannot contain non-single-space whitespace" CHECK (((description IS NULL) OR (description !~ '[
	]'::text)))
);


ALTER TABLE plhdb.probability_type OWNER TO plhdb_admin;

--
-- Name: TABLE probability_type; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.probability_type IS 'One row per kind of probability distribution.  This table establishes
a controlled vocabulary for probability distributions.';


--
-- Name: COLUMN probability_type.code; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.probability_type.code IS 'A unique single character code for the probability type.  This code
identifies the row within the database.';


--
-- Name: COLUMN probability_type.description; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.probability_type.description IS 'A unique description of the kind of probability distribution.';


--
-- Name: COLUMN probability_type.symmetrical; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.probability_type.symmetrical IS 'TRUE when the related data-endpoints must be "symmetrical" about the
distribution''s most likely value, in the same way that the endpoints
of a normal distribution are equidistant from the mean, median, and
mode.  FALSE when the related data need not be.  In effect, denotes
whether the probability distribution is a normal distribution.  When a
PROBABILITY_TYPE row is related to data consisting of a value, a
minimum, and a maximum (as it is with BIOGRAPHY''s BirthDate, BDMin,
and BDMax columns) symmetry requires that the value be midway between
the minimum and the maximum.  Because some intervals are measured in
discrete time units (i.e. days) the midpoint is defined to be either
one of the 2 midpoint dates when there are an even number of days in
the min-to-max interval.

The value of this column cannot be changed.';


--
-- Name: site; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.site (
    siteid integer NOT NULL,
    name character varying(64) NOT NULL,
    latitude numeric(7,3),
    longitude numeric(7,3),
    geodetic_datum character varying(12) DEFAULT 'WGS84'::character varying,
    CONSTRAINT "Geodetic_Datum: Cannot be empty or only whitespace characters" CHECK ((btrim((geodetic_datum)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Geodetic_Datum: Cannot begin or end with spaces" CHECK ((((geodetic_datum)::text !~ '$ '::text) AND ((geodetic_datum)::text !~ ' $'::text))),
    CONSTRAINT "Geodetic_Datum: Cannot contain non-single-space whitespace" CHECK (((geodetic_datum IS NULL) OR ((geodetic_datum)::text !~ '[
	]'::text))),
    CONSTRAINT "Name: Cannot be empty or only whitespace characters" CHECK ((btrim((name)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Name: Cannot begin or end with spaces" CHECK ((((name)::text !~ '$ '::text) AND ((name)::text !~ ' $'::text))),
    CONSTRAINT "Name: Cannot contain non-single-space whitespace" CHECK (((name IS NULL) OR ((name)::text !~ '[
	]'::text)))
);


ALTER TABLE plhdb.site OWNER TO plhdb_admin;

--
-- Name: TABLE site; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.site IS 'One row per site where a study was or is being conducted.  One pair of
geographic coordinates are designated to the entire site.';


--
-- Name: COLUMN site.siteid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.site.siteid IS 'Unique row identifier.  The value of this column is automatically
assigned by the system; the normal practice, which results in a system
generated id, is to omit this column when inserting new rows or to
supply a NULL value.  The value of this column cannot be NULL.';


--
-- Name: COLUMN site.name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.site.name IS 'The name of the site, which must be unique. This may be a short or a
long name, depending on what the study uses.';


--
-- Name: COLUMN site.latitude; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.site.latitude IS 'The decimal latitude coordinate of the site, using positive and
negative sign to indicate N and S, respectively.';


--
-- Name: COLUMN site.longitude; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.site.longitude IS 'The decimal longitude coordinate of the site, using positive and
negative sign to indicate E and W, respectively.';


--
-- Name: COLUMN site.geodetic_datum; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.site.geodetic_datum IS 'The geodetic system on which the geo-coordinates are based.  For
geo-coordinates measured between 1984 and 2010 this will typically be
WGS84, which is the default value.';


--
-- Name: site_siteid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.site_siteid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.site_siteid_seq OWNER TO plhdb_admin;

--
-- Name: site_siteid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.site_siteid_seq OWNED BY plhdb.site.siteid;


--
-- Name: start_event; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.start_event (
    code character(1) NOT NULL,
    description character varying(64) NOT NULL,
    initial boolean NOT NULL,
    CONSTRAINT "Code: Cannot be empty or only whitespace characters" CHECK ((btrim((code)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Code: Cannot begin or end with spaces" CHECK (((code !~ '$ '::text) AND (code !~ ' $'::text))),
    CONSTRAINT "Code: Cannot contain non-single-space whitespace" CHECK (((code IS NULL) OR (code !~ '[
	]'::text))),
    CONSTRAINT "Description: Cannot be empty or only whitespace characters" CHECK ((btrim((description)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Description: Cannot begin or end with spaces" CHECK ((((description)::text !~ '$ '::text) AND ((description)::text !~ ' $'::text))),
    CONSTRAINT "Description: Cannot contain non-single-space whitespace" CHECK (((description IS NULL) OR ((description)::text !~ '[
	]'::text)))
);


ALTER TABLE plhdb.start_event OWNER TO plhdb_admin;

--
-- Name: TABLE start_event; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.start_event IS 'One row per kind of event which begins the interval of time during
which the lives of study individuals are tracked.  This table
establishes a controlled vocabulary for the events which mark the
start of observation.';


--
-- Name: COLUMN start_event.code; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.start_event.code IS 'A unique single character code for the start of observation type.
This code identifies the row within the database.';


--
-- Name: COLUMN start_event.description; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.start_event.description IS 'A unique description of the start of observation type.';


--
-- Name: COLUMN start_event.initial; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.start_event.initial IS 'A boolean value.  When TRUE indicates that there may be no preceeding
events.  Birth is an example end event where Initial should be TRUE.

This flag may impose additional requirements; this is dependent upon
the table referencing the START_EVENT row.  For more information see
the documentation of each table which uses START_EVENT for vocabulary
control.

The value of this column may not be NULL.';


--
-- Name: study; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.study (
    sid character varying(12) NOT NULL,
    name character varying(32),
    owners character varying(128),
    taxonid integer NOT NULL,
    siteid integer NOT NULL,
    CONSTRAINT "Name: Cannot be empty or only whitespace characters" CHECK ((btrim((name)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Name: Cannot begin or end with spaces" CHECK ((((name)::text !~ '$ '::text) AND ((name)::text !~ ' $'::text))),
    CONSTRAINT "Name: Cannot contain non-single-space whitespace" CHECK (((name IS NULL) OR ((name)::text !~ '[
	]'::text))),
    CONSTRAINT "Owners: Cannot be empty or only whitespace characters" CHECK ((btrim((owners)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Owners: Cannot begin or end with spaces" CHECK ((((owners)::text !~ '$ '::text) AND ((owners)::text !~ ' $'::text))),
    CONSTRAINT "Owners: Cannot contain non-single-space whitespace" CHECK (((owners IS NULL) OR ((owners)::text !~ '[
	]'::text))),
    CONSTRAINT "SId may not be 'all'" CHECK (((sid)::text <> 'all'::text)),
    CONSTRAINT "SId: Cannot be empty or only whitespace characters" CHECK ((btrim((sid)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "SId: Cannot begin or end with spaces" CHECK ((((sid)::text !~ '$ '::text) AND ((sid)::text !~ ' $'::text))),
    CONSTRAINT "SId: Cannot contain non-single-space whitespace" CHECK (((sid IS NULL) OR ((sid)::text !~ '[
	]'::text)))
);


ALTER TABLE plhdb.study OWNER TO plhdb_admin;

--
-- Name: TABLE study; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.study IS 'One row per study.  The study within which the individuals have been
observed.  At present, the same taxon and the same site applies to all
individuals within the study.';


--
-- Name: COLUMN study.sid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.sid IS 'Unique row identifier.  May not be ''all'' or NULL.';


--
-- Name: COLUMN study.name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.name IS 'The name of the study. This may be a descriptive or encoded, must be
unique if not NULL.';


--
-- Name: COLUMN study.owners; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.owners IS 'The owners of the observational data that this study gave rise to.
This may be a single person, an organization, or a (comma-delimited)
list of such.';


--
-- Name: COLUMN study.taxonid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.taxonid IS 'The row identifier of the taxon for the individuals that were or are
being observed in this study.';


--
-- Name: COLUMN study.siteid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.study.siteid IS 'The row identifer of the site where this study was or is being
conducted, and hence where the individuals have been observed.';


--
-- Name: studies; Type: VIEW; Schema: plhdb; Owner: plhdb_admin
--

CREATE VIEW plhdb.studies AS
 SELECT study.sid,
    study.name,
    study.owners,
    study.taxonid,
    study.siteid,
    ( SELECT biography.departdate
           FROM plhdb.biography
          WHERE (((biography.studyid)::text = (study.sid)::text) AND (biography.departdate IS NOT NULL))
          ORDER BY biography.departdate DESC
         LIMIT 1) AS latest_departdate
   FROM plhdb.study;


ALTER TABLE plhdb.studies OWNER TO plhdb_admin;

--
-- Name: VIEW studies; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON VIEW plhdb.studies IS 'One row per study.  This view is identical to the STUDY table, except
for the addition of the Latest_DepartDate column.

As in the STUDY table, this table is not affected by any row-level
security policies. Users with no rows PERMISSION are still able to see
this view''s data.';


--
-- Name: COLUMN studies.sid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.studies.sid IS 'Unique row identifier.  May not be ''all'' or NULL.';


--
-- Name: COLUMN studies.name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.studies.name IS 'The name of the study. This may be a descriptive or encoded, must be
unique if not NULL.';


--
-- Name: COLUMN studies.owners; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.studies.owners IS 'The owners of the observational data that this study gave rise to.
This may be a single person, an organization, or a (comma-delimited)
list of such.';


--
-- Name: COLUMN studies.taxonid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.studies.taxonid IS 'The row identifier of the taxon for the individuals that were or are
being observed in this study.';


--
-- Name: COLUMN studies.siteid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.studies.siteid IS 'The row identifer of the site where this study was or is being
conducted, and hence where the individuals have been observed.';


--
-- Name: COLUMN studies.latest_departdate; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.studies.latest_departdate IS 'The latest (most recent) BIOGRAPHY.DepartDate for this study, or NULL
if this study has no BIOGRAPHY rows with a non-NULL DepartDate.';


--
-- Name: taxon; Type: TABLE; Schema: plhdb; Owner: plhdb_admin
--

CREATE TABLE plhdb.taxon (
    taxonid integer NOT NULL,
    scientific_name character varying(128) NOT NULL,
    common_name character varying(64),
    CONSTRAINT "Common_Name: Cannot be empty or only whitespace characters" CHECK ((btrim((common_name)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Common_Name: Cannot begin or end with spaces" CHECK ((((common_name)::text !~ '$ '::text) AND ((common_name)::text !~ ' $'::text))),
    CONSTRAINT "Common_Name: Cannot contain non-single-space whitespace" CHECK (((common_name IS NULL) OR ((common_name)::text !~ '[
	]'::text))),
    CONSTRAINT "Scientific_Name: Cannot be empty or only whitespace characters" CHECK ((btrim((scientific_name)::text, ' 
	v'::text) <> ''::text)),
    CONSTRAINT "Scientific_Name: Cannot begin or end with spaces" CHECK ((((scientific_name)::text !~ '$ '::text) AND ((scientific_name)::text !~ ' $'::text))),
    CONSTRAINT "Scientific_Name: Cannot contain non-single-space whitespace" CHECK (((scientific_name IS NULL) OR ((scientific_name)::text !~ '[
	]'::text)))
);


ALTER TABLE plhdb.taxon OWNER TO plhdb_admin;

--
-- Name: TABLE taxon; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON TABLE plhdb.taxon IS 'One row per taxon studied.  For now, this is a very simplified taxon
model with no identification of the taxonomy being used, and there can
be only two names, one scientific and one common.';


--
-- Name: COLUMN taxon.taxonid; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.taxon.taxonid IS 'Unique row identifier.  The value of this column is automatically
assigned by the system; the normal practice, which results in a system
generated id, is to omit this column when inserting new rows or to
supply a NULL value.  The value of this column cannot be NULL.';


--
-- Name: COLUMN taxon.scientific_name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.taxon.scientific_name IS 'The scientific name for the taxon, using for example the NCBI or the
ITIS taxonomies.';


--
-- Name: COLUMN taxon.common_name; Type: COMMENT; Schema: plhdb; Owner: plhdb_admin
--

COMMENT ON COLUMN plhdb.taxon.common_name IS 'The common name for the taxon. This need not be the most common or
generally accepted name, but the common name used within the study.';


--
-- Name: taxon_taxonid_seq; Type: SEQUENCE; Schema: plhdb; Owner: plhdb_admin
--

CREATE SEQUENCE plhdb.taxon_taxonid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plhdb.taxon_taxonid_seq OWNER TO plhdb_admin;

--
-- Name: taxon_taxonid_seq; Type: SEQUENCE OWNED BY; Schema: plhdb; Owner: plhdb_admin
--

ALTER SEQUENCE plhdb.taxon_taxonid_seq OWNED BY plhdb.taxon.taxonid;


--
-- Name: biography bid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.biography ALTER COLUMN bid SET DEFAULT nextval('plhdb.biography_bid_seq'::regclass);


--
-- Name: fertility fid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.fertility ALTER COLUMN fid SET DEFAULT nextval('plhdb.fertility_fid_seq'::regclass);


--
-- Name: permission pid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.permission ALTER COLUMN pid SET DEFAULT nextval('plhdb.permission_pid_seq'::regclass);


--
-- Name: site siteid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.site ALTER COLUMN siteid SET DEFAULT nextval('plhdb.site_siteid_seq'::regclass);


--
-- Name: taxon taxonid; Type: DEFAULT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.taxon ALTER COLUMN taxonid SET DEFAULT nextval('plhdb.taxon_taxonid_seq'::regclass);


--
-- Name: biography biography_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.biography
    ADD CONSTRAINT biography_pkey PRIMARY KEY (bid);


--
-- Name: end_event end_event_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.end_event
    ADD CONSTRAINT end_event_pkey PRIMARY KEY (code);


--
-- Name: fertility fertility_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.fertility
    ADD CONSTRAINT fertility_pkey PRIMARY KEY (fid);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (pid);


--
-- Name: probability_type probability_type_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.probability_type
    ADD CONSTRAINT probability_type_pkey PRIMARY KEY (code);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (siteid);


--
-- Name: start_event start_event_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.start_event
    ADD CONSTRAINT start_event_pkey PRIMARY KEY (code);


--
-- Name: study study_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.study
    ADD CONSTRAINT study_pkey PRIMARY KEY (sid);


--
-- Name: taxon taxon_pkey; Type: CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.taxon
    ADD CONSTRAINT taxon_pkey PRIMARY KEY (taxonid);


--
-- Name: biography_animid; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_animid ON plhdb.biography USING btree (animid);


--
-- Name: biography_animname; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_animname ON plhdb.biography USING btree (animname);


--
-- Name: biography_bdmax; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_bdmax ON plhdb.biography USING btree (bdmax);


--
-- Name: biography_bdmin; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_bdmin ON plhdb.biography USING btree (bdmin);


--
-- Name: biography_birthdate; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_birthdate ON plhdb.biography USING btree (birthdate);


--
-- Name: biography_birthgroup; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_birthgroup ON plhdb.biography USING btree (birthgroup);


--
-- Name: biography_departdate; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_departdate ON plhdb.biography USING btree (departdate);


--
-- Name: biography_entrydate; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_entrydate ON plhdb.biography USING btree (entrydate);


--
-- Name: biography_mombid; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_mombid ON plhdb.biography USING btree (mombid);


--
-- Name: biography_studyid; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX biography_studyid ON plhdb.biography USING btree (studyid);


--
-- Name: biography_studyid_animid; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX biography_studyid_animid ON plhdb.biography USING btree (studyid, animid);


--
-- Name: biography_studyid_animname; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX biography_studyid_animname ON plhdb.biography USING btree (studyid, animname);


--
-- Name: end_event_description; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX end_event_description ON plhdb.end_event USING btree (description);


--
-- Name: fertility_bid; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX fertility_bid ON plhdb.fertility USING btree (bid);


--
-- Name: fertility_startdate; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX fertility_startdate ON plhdb.fertility USING btree (startdate);


--
-- Name: fertility_starttype; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX fertility_starttype ON plhdb.fertility USING btree (starttype);


--
-- Name: fertility_stopdate; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX fertility_stopdate ON plhdb.fertility USING btree (stopdate);


--
-- Name: fertility_stoptype; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX fertility_stoptype ON plhdb.fertility USING btree (stoptype);


--
-- Name: permission_username; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE INDEX permission_username ON plhdb.permission USING btree (username);


--
-- Name: permission_username_study; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX permission_username_study ON plhdb.permission USING btree (username, study);


--
-- Name: probability_type_description; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX probability_type_description ON plhdb.probability_type USING btree (description);


--
-- Name: site_name; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX site_name ON plhdb.site USING btree (name);


--
-- Name: start_event_description; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX start_event_description ON plhdb.start_event USING btree (description);


--
-- Name: study_name; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX study_name ON plhdb.study USING btree (name);


--
-- Name: taxon_common_name; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX taxon_common_name ON plhdb.taxon USING btree (common_name);


--
-- Name: taxon_scientific_name; Type: INDEX; Schema: plhdb; Owner: plhdb_admin
--

CREATE UNIQUE INDEX taxon_scientific_name ON plhdb.taxon USING btree (scientific_name);


--
-- Name: biographies biographies_delete_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER biographies_delete_trigger INSTEAD OF DELETE ON plhdb.biographies FOR EACH ROW EXECUTE FUNCTION plhdb.biographies_delete_func();


--
-- Name: biographies biographies_insert_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER biographies_insert_trigger INSTEAD OF INSERT ON plhdb.biographies FOR EACH ROW EXECUTE FUNCTION plhdb.biographies_insert_func();


--
-- Name: biographies biographies_update_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER biographies_update_trigger INSTEAD OF UPDATE ON plhdb.biographies FOR EACH ROW EXECUTE FUNCTION plhdb.biographies_update_func();


--
-- Name: biography biography_commit_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE CONSTRAINT TRIGGER biography_commit_trigger AFTER INSERT OR UPDATE ON plhdb.biography DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION plhdb.biography_commit_func();


--
-- Name: biography biography_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER biography_trigger AFTER INSERT OR UPDATE ON plhdb.biography FOR EACH ROW EXECUTE FUNCTION plhdb.biography_func();


--
-- Name: end_event end_event_update_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER end_event_update_trigger AFTER UPDATE ON plhdb.end_event FOR EACH ROW EXECUTE FUNCTION plhdb.end_event_update_func();


--
-- Name: fertilities fertilities_delete_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER fertilities_delete_trigger INSTEAD OF DELETE ON plhdb.fertilities FOR EACH ROW EXECUTE FUNCTION plhdb.fertilities_delete_func();


--
-- Name: fertilities fertilities_insert_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER fertilities_insert_trigger INSTEAD OF INSERT ON plhdb.fertilities FOR EACH ROW EXECUTE FUNCTION plhdb.fertilities_insert_func();


--
-- Name: fertilities fertilities_update_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER fertilities_update_trigger INSTEAD OF UPDATE ON plhdb.fertilities FOR EACH ROW EXECUTE FUNCTION plhdb.fertilities_update_func();


--
-- Name: fertility fertility_commit_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE CONSTRAINT TRIGGER fertility_commit_trigger AFTER INSERT OR UPDATE ON plhdb.fertility DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION plhdb.fertility_commit_func();


--
-- Name: fertility fertility_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER fertility_trigger AFTER INSERT OR UPDATE ON plhdb.fertility FOR EACH ROW EXECUTE FUNCTION plhdb.fertility_func();


--
-- Name: permission permission_delete_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER permission_delete_trigger AFTER DELETE ON plhdb.permission FOR EACH ROW EXECUTE FUNCTION plhdb.permission_delete_func();


--
-- Name: permission permission_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER permission_trigger AFTER INSERT OR UPDATE ON plhdb.permission FOR EACH ROW EXECUTE FUNCTION plhdb.permission_func();


--
-- Name: probability_type probability_type_update_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER probability_type_update_trigger AFTER UPDATE ON plhdb.probability_type FOR EACH ROW EXECUTE FUNCTION plhdb.probability_type_update_func();


--
-- Name: start_event start_event_update_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER start_event_update_trigger AFTER UPDATE ON plhdb.start_event FOR EACH ROW EXECUTE FUNCTION plhdb.start_event_update_func();


--
-- Name: study study_delete_trigger; Type: TRIGGER; Schema: plhdb; Owner: plhdb_admin
--

CREATE TRIGGER study_delete_trigger AFTER DELETE ON plhdb.study FOR EACH ROW EXECUTE FUNCTION plhdb.study_delete_func();


--
-- Name: biography BDDist must be a PROBABILITY_TYPE.Code value; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.biography
    ADD CONSTRAINT "BDDist must be a PROBABILITY_TYPE.Code value" FOREIGN KEY (bddist) REFERENCES plhdb.probability_type(code);


--
-- Name: fertility BId must be BIOGRAPHY.BId value; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.fertility
    ADD CONSTRAINT "BId must be BIOGRAPHY.BId value" FOREIGN KEY (bid) REFERENCES plhdb.biography(bid);


--
-- Name: biography DepartType must be a END_EVENT.Code value; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.biography
    ADD CONSTRAINT "DepartType must be a END_EVENT.Code value" FOREIGN KEY (departtype) REFERENCES plhdb.end_event(code);


--
-- Name: biography EntryType must be a START_EVENT.Code value; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.biography
    ADD CONSTRAINT "EntryType must be a START_EVENT.Code value" FOREIGN KEY (entrytype) REFERENCES plhdb.start_event(code);


--
-- Name: biography MomBId must be a BIOGRAPHY.BId value; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.biography
    ADD CONSTRAINT "MomBId must be a BIOGRAPHY.BId value" FOREIGN KEY (mombid) REFERENCES plhdb.biography(bid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: study SiteId on SITE; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.study
    ADD CONSTRAINT "SiteId on SITE" FOREIGN KEY (siteid) REFERENCES plhdb.site(siteid);


--
-- Name: fertility StartType must be a START_EVENT.Code value; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.fertility
    ADD CONSTRAINT "StartType must be a START_EVENT.Code value" FOREIGN KEY (starttype) REFERENCES plhdb.start_event(code);


--
-- Name: fertility StopType must be a END_EVENT.Code value; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.fertility
    ADD CONSTRAINT "StopType must be a END_EVENT.Code value" FOREIGN KEY (stoptype) REFERENCES plhdb.end_event(code);


--
-- Name: biography StudyId must be a STUDY.Id value; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.biography
    ADD CONSTRAINT "StudyId must be a STUDY.Id value" FOREIGN KEY (studyid) REFERENCES plhdb.study(sid);


--
-- Name: study TaxonId on TAXON; Type: FK CONSTRAINT; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE ONLY plhdb.study
    ADD CONSTRAINT "TaxonId on TAXON" FOREIGN KEY (taxonid) REFERENCES plhdb.taxon(taxonid);


--
-- Name: biography all_access; Type: POLICY; Schema: plhdb; Owner: plhdb_admin
--

CREATE POLICY all_access ON plhdb.biography USING (plhdb.biography_all_access(studyid));


--
-- Name: fertility all_access; Type: POLICY; Schema: plhdb; Owner: plhdb_admin
--

CREATE POLICY all_access ON plhdb.fertility USING (plhdb.fertility_all_access(bid));


--
-- Name: biography; Type: ROW SECURITY; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE plhdb.biography ENABLE ROW LEVEL SECURITY;

--
-- Name: biography edit_access; Type: POLICY; Schema: plhdb; Owner: plhdb_admin
--

CREATE POLICY edit_access ON plhdb.biography FOR UPDATE USING (plhdb.biography_edit_access(studyid));


--
-- Name: fertility edit_access; Type: POLICY; Schema: plhdb; Owner: plhdb_admin
--

CREATE POLICY edit_access ON plhdb.fertility FOR UPDATE USING (plhdb.fertility_edit_access(bid));


--
-- Name: fertility; Type: ROW SECURITY; Schema: plhdb; Owner: plhdb_admin
--

ALTER TABLE plhdb.fertility ENABLE ROW LEVEL SECURITY;

--
-- Name: biography insert_access; Type: POLICY; Schema: plhdb; Owner: plhdb_admin
--

CREATE POLICY insert_access ON plhdb.biography FOR INSERT WITH CHECK (plhdb.biography_insert_access(studyid));


--
-- Name: fertility insert_access; Type: POLICY; Schema: plhdb; Owner: plhdb_admin
--

CREATE POLICY insert_access ON plhdb.fertility FOR INSERT WITH CHECK (plhdb.fertility_insert_access(bid));


--
-- Name: biography search_access; Type: POLICY; Schema: plhdb; Owner: plhdb_admin
--

CREATE POLICY search_access ON plhdb.biography FOR SELECT USING (plhdb.biography_search_access(studyid));


--
-- Name: fertility search_access; Type: POLICY; Schema: plhdb; Owner: plhdb_admin
--

CREATE POLICY search_access ON plhdb.fertility FOR SELECT USING (plhdb.fertility_search_access(bid));


--
-- Name: DATABASE plhdb; Type: ACL; Schema: -; Owner: plhdb_admin
--

REVOKE CONNECT,TEMPORARY ON DATABASE plhdb FROM PUBLIC;
GRANT TEMPORARY ON DATABASE plhdb TO PUBLIC;
GRANT CONNECT ON DATABASE plhdb TO plhdb_managers;
GRANT CONNECT ON DATABASE plhdb TO plhdb_users;


--
-- Name: SCHEMA plhdb; Type: ACL; Schema: -; Owner: plhdb_admin
--

GRANT USAGE ON SCHEMA plhdb TO plhdb_managers;
GRANT USAGE ON SCHEMA plhdb TO plhdb_users;


--
-- Name: SCHEMA sandbox; Type: ACL; Schema: -; Owner: plhdb_admin
--

GRANT ALL ON SCHEMA sandbox TO plhdb_managers;
GRANT USAGE ON SCHEMA sandbox TO plhdb_users;


--
-- Name: FUNCTION biography_all_access(studyid character varying); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.biography_all_access(studyid character varying) TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.biography_all_access(studyid character varying) TO plhdb_managers;


--
-- Name: FUNCTION biography_edit_access(studyid character varying); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.biography_edit_access(studyid character varying) TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.biography_edit_access(studyid character varying) TO plhdb_managers;


--
-- Name: FUNCTION biography_insert_access(studyid character varying); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.biography_insert_access(studyid character varying) TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.biography_insert_access(studyid character varying) TO plhdb_managers;


--
-- Name: FUNCTION biography_search_access(studyid character varying); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.biography_search_access(studyid character varying) TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.biography_search_access(studyid character varying) TO plhdb_managers;


--
-- Name: FUNCTION fertility_all_access(this_bid integer); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.fertility_all_access(this_bid integer) TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.fertility_all_access(this_bid integer) TO plhdb_managers;


--
-- Name: FUNCTION fertility_edit_access(this_bid integer); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.fertility_edit_access(this_bid integer) TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.fertility_edit_access(this_bid integer) TO plhdb_managers;


--
-- Name: FUNCTION fertility_insert_access(this_bid integer); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.fertility_insert_access(this_bid integer) TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.fertility_insert_access(this_bid integer) TO plhdb_managers;


--
-- Name: FUNCTION fertility_search_access(this_bid integer); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.fertility_search_access(this_bid integer) TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.fertility_search_access(this_bid integer) TO plhdb_managers;


--
-- Name: FUNCTION is_superuser(); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.is_superuser() TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.is_superuser() TO plhdb_managers;


--
-- Name: FUNCTION last_departdate(departdate date, departdateerror double precision); Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT ALL ON FUNCTION plhdb.last_departdate(departdate date, departdateerror double precision) TO plhdb_users;
GRANT ALL ON FUNCTION plhdb.last_departdate(departdate date, departdateerror double precision) TO plhdb_managers;


--
-- Name: TABLE access_groups; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.access_groups TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.access_groups TO plhdb_users;


--
-- Name: TABLE accounts; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.accounts TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.accounts TO plhdb_users;


--
-- Name: TABLE biography; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.biography TO plhdb_users;
GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.biography TO plhdb_managers;


--
-- Name: TABLE biographies; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.biographies TO plhdb_users;
GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.biographies TO plhdb_managers;


--
-- Name: TABLE end_event; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.end_event TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.end_event TO plhdb_users;


--
-- Name: TABLE fertility; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.fertility TO plhdb_users;
GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.fertility TO plhdb_managers;


--
-- Name: TABLE fertilities; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.fertilities TO plhdb_users;
GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.fertilities TO plhdb_managers;


--
-- Name: TABLE permission; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.permission TO plhdb_managers;


--
-- Name: SEQUENCE permission_pid_seq; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,UPDATE ON SEQUENCE plhdb.permission_pid_seq TO plhdb_managers;


--
-- Name: TABLE permissions; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.permissions TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.permissions TO plhdb_users;


--
-- Name: TABLE probability_type; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.probability_type TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.probability_type TO plhdb_users;


--
-- Name: TABLE site; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.site TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.site TO plhdb_users;


--
-- Name: SEQUENCE site_siteid_seq; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,UPDATE ON SEQUENCE plhdb.site_siteid_seq TO plhdb_managers;
GRANT SELECT ON SEQUENCE plhdb.site_siteid_seq TO plhdb_users;


--
-- Name: TABLE start_event; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.start_event TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.start_event TO plhdb_users;


--
-- Name: TABLE study; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.study TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.study TO plhdb_users;


--
-- Name: TABLE studies; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.studies TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.studies TO plhdb_users;


--
-- Name: TABLE taxon; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE plhdb.taxon TO plhdb_managers;
GRANT SELECT,REFERENCES ON TABLE plhdb.taxon TO plhdb_users;


--
-- Name: SEQUENCE taxon_taxonid_seq; Type: ACL; Schema: plhdb; Owner: plhdb_admin
--

GRANT SELECT,UPDATE ON SEQUENCE plhdb.taxon_taxonid_seq TO plhdb_managers;
GRANT SELECT ON SEQUENCE plhdb.taxon_taxonid_seq TO plhdb_users;