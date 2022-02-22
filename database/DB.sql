USE master
GO

CREATE DATABASE ivalia
GO

USE ivalia
GO

CREATE TABLE Roles (
	id		CHAR NOT NULL PRIMARY KEY,
	[name]	VARCHAR(30) NOT NULL
)
GO

CREATE TABLE Users (
	id			INT IDENTITY NOT NULL PRIMARY KEY,
	[role]		CHAR NOT NULL,
	fullname	VARCHAR(80) NOT NULL,
	username	VARCHAR(30) NOT NULL,
	[password]	VARCHAR(MAX) NOT NULL,
	email		VARCHAR(100) NOT NULL,
	prof_pic	VARCHAR(MAX) NULL,
	[status]	CHAR NOT NULL,

	CONSTRAINT fk_user_role
	FOREIGN KEY ([role])
	REFERENCES Roles (id)
)
GO

CREATE TABLE Clients (
	id			INT IDENTITY NOT NULL PRIMARY KEY,
	rfc			VARCHAR(20) NOT NULL,
	fullname	VARCHAR(80) NOT NULL,
	logo		VARCHAR(MAX) NULL,
	[status]	CHAR NOT NULL
)
GO

CREATE TABLE ClientUsers (
	id_client	INT NOT NULL,
	id_user		INT NOT NULL,

	CONSTRAINT fk_client_user_client
	FOREIGN KEY (id_client)
	REFERENCES Clients (id),

	CONSTRAINT fk_client_user_user
	FOREIGN KEY (id_user)
	REFERENCES Users (id),

	CONSTRAINT pk_client_users
	PRIMARY KEY (id_client, id_user)
)
GO

CREATE TABLE Years (
	id			INT IDENTITY NOT NULL PRIMARY KEY,
	[year]		INT NOT NULL,
	[status]	CHAR NOT NULL
)
GO

CREATE TABLE [Periods] (
	id			INT IDENTITY NOT NULL PRIMARY KEY,
	id_client	INT NOT NULL,
	id_year		INT NOT NULL,
	[name]		VARCHAR(50) NOT NULL,
	[status]	CHAR NOT NULL,

	CONSTRAINT fk_period_client
	FOREIGN KEY (id_client)
	REFERENCES Clients (id),

	CONSTRAINT fk_period_year
	FOREIGN KEY (id_year)
	REFERENCES Years (id)
)
GO

CREATE TABLE Plots (
	id				INT IDENTITY NOT NULL PRIMARY KEY,
	id_period		INT NOT NULL,
	[description]	VARCHAR(150) NOT NULL,
	[filename]		VARCHAR(MAX) NOT NULL,
	upload_date		DATETIME NOT NULL,

	CONSTRAINT fk_plot_period
	FOREIGN KEY (id_period)
	REFERENCES [Periods] (id)
)
GO

CREATE TABLE Files (
	id				INT IDENTITY NOT NULL PRIMARY KEY,
	id_creator		INT NOT NULL,
	id_period		INT NOT NULL,
	[filename]		VARCHAR(MAX) NOT NULL,
	upload_date		DATETIME NOT NULL,

	CONSTRAINT fk_file_creator
	FOREIGN KEY (id_creator)
	REFERENCES Users (id),

	CONSTRAINT fk_file_period
	FOREIGN KEY (id_period)
	REFERENCES [Periods] (id)
)
GO

CREATE TABLE Tools (
	id				INT IDENTITY NOT NULL PRIMARY KEY,
	id_creator		INT NOT NULL,
	[description]	VARCHAR(100) NOT NULL,
	[filename]		VARCHAR(MAX) NOT NULL,
	upload_date		DATETIME NOT NULL,

	CONSTRAINT fk_tool_creator
	FOREIGN KEY (id_creator)
	REFERENCES Users (id)
)
GO

CREATE TABLE News (
	id				INT IDENTITY NOT NULL PRIMARY KEY,
	id_creator		INT NOT NULL,
	title			VARCHAR(MAX) NOT NULL,
	content			VARCHAR(MAX) NOT NULL,
	attachment		VARCHAR(MAX) NULL,
	hyperlink		VARCHAR(MAX) NULL,
	upload_date		DATETIME NOT NULL,
	[status]		CHAR NOT NULL,

	CONSTRAINT fk_new_creator
	FOREIGN KEY (id_creator)
	REFERENCES Users (id)
)
GO

CREATE TABLE Links (
	id				INT IDENTITY NOT NULL PRIMARY KEY,
	id_creator		INT NOT NULL,
	[description]	VARCHAR(100) NOT NULL,
	hyperlink		VARCHAR(MAX) NOT NULL,
	upload_date		DATETIME NOT NULL,

	CONSTRAINT fk_link_creator
	FOREIGN KEY (id_creator)
	REFERENCES Users (id)
)
GO

CREATE TABLE Tasks (
	id				INT IDENTITY NOT NULL PRIMARY KEY,
	id_from			INT NOT NULL,
	id_to			INT NOT NULL,
	title			VARCHAR(50) NOT NULL,
	[description]	VARCHAR(200) NOT NULL,
	upload_date		DATETIME NOT NULL,
	creation_date	DATETIME NOT NULL,
	[start_date]	DATETIME NULL,
	[goal_date]	DATETIME NULL,

	CONSTRAINT fk_task_from
	FOREIGN KEY (id_from)
	REFERENCES Users (id),

	CONSTRAINT fk_task_to
	FOREIGN KEY (id_to)
	REFERENCES Users (id)
)
GO