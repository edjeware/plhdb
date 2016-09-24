dnl Copyright (C) 2016 The Meme Factory, Inc.  http://www.meme.com/
dnl
dnl    This file is part of PLHDB2.
dnl
dnl    PLDHB2 is free software; you can redistribute it and/or modify
dnl    it under the terms of the GNU General Public License as published by
dnl    the Free Software Foundation; either version 3 of the License, or
dnl    (at your option) any later version.
dnl
dnl    This program is distributed in the hope that it will be useful,
dnl    but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl    GNU General Public License for more details.
dnl
dnl    You should have received a copy of the GNU General Public License
dnl    along with Babase.  If not, see <http://www.gnu.org/licenses/>.
dnl
dnl Karl O. Pinc <kop@meme.com>
dnl

include(`copyright.m4')
include(`tablemacros.m4')
include(`grants.m4')
include(`constants.m4')

CREATE TABLE probability_type (
  code CHAR(1) PRIMARY KEY
  empty_string_check(`Code')
  sensible_whitespace(`Code')
, name VARCHAR(64) NOT NULL
  empty_string_check(`Name')
  sensible_whitespace(`Name'));

grant_priv(`probability_type', `code')


COMMENT ON TABLE probability_type IS
'One row per kind of probability distribution.  This table establishes
a controlled vocabularly for probability distributions.';

COMMENT ON COLUMN probability_type.code IS
'A unique single character code for the probability type.  This code
identifies the row within the database.';

COMMENT ON COLUMN probability_type.name IS
'A unique description of the kind of probability distribution.';


CREATE UNIQUE INDEX probability_type_name
  ON probability_type (name);
