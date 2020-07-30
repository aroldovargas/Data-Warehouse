CREATE TABLE Dim_Data(
	date_key SMALLINT NOT NULL,
	full_date DATE,
	day_of_week INTEGER,
	day_num_in_month INTEGER,
	day_name VARCHAR(9),
	weekday_flag CHAR(1),
	week_num_in_year INTEGER,
	month INTEGER,
	month_name VARCHAR(9),
	quarter INTEGER,
	year SMALLINT,
	primary key(date_key)
)