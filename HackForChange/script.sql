CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);
    
START TRANSACTION;

CREATE TABLE "Mentors" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Email" text NOT NULL,
    "Created" timestamp with time zone NOT NULL,
    "Updated" timestamp with time zone NOT NULL,
    CONSTRAINT "PK_Mentors" PRIMARY KEY ("Id")
);

CREATE TABLE "Students" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Email" text NOT NULL,
    "Created" timestamp with time zone NOT NULL,
    "Updated" timestamp with time zone NOT NULL,
    CONSTRAINT "PK_Students" PRIMARY KEY ("Id")
);

CREATE TABLE "Subjects" (
    "Id" uuid NOT NULL,
    "Description" text NOT NULL,
    "Created" timestamp with time zone NOT NULL,
    "Updated" timestamp with time zone NOT NULL,
    CONSTRAINT "PK_Subjects" PRIMARY KEY ("Id")
);

CREATE TABLE "MentorSubject" (
    "MentorsId" uuid NOT NULL,
    "SpecialtiesId" uuid NOT NULL,
    CONSTRAINT "PK_MentorSubject" PRIMARY KEY ("MentorsId", "SpecialtiesId"),
    CONSTRAINT "FK_MentorSubject_Mentors_MentorsId" FOREIGN KEY ("MentorsId") REFERENCES "Mentors" ("Id"),
    CONSTRAINT "FK_MentorSubject_Subjects_SpecialtiesId" FOREIGN KEY ("SpecialtiesId") REFERENCES "Subjects" ("Id")
);

CREATE TABLE "Schedulings" (
    "Id" uuid NOT NULL,
    "AppointmentTimes" timestamp with time zone NOT NULL,
    "StartTime" timestamp with time zone NULL,
    "ClosingTime" timestamp with time zone NULL,
    "SubjectId" uuid NOT NULL,
    "Created" timestamp with time zone NOT NULL,
    "Updated" timestamp with time zone NOT NULL,
    CONSTRAINT "PK_Schedulings" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Schedulings_Subjects_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES "Subjects" ("Id")
);

CREATE TABLE "StudentSubject" (
    "DifficultSubjectsId" uuid NOT NULL,
    "StudentsId" uuid NOT NULL,
    CONSTRAINT "PK_StudentSubject" PRIMARY KEY ("DifficultSubjectsId", "StudentsId"),
    CONSTRAINT "FK_StudentSubject_Students_StudentsId" FOREIGN KEY ("StudentsId") REFERENCES "Students" ("Id"),
    CONSTRAINT "FK_StudentSubject_Subjects_DifficultSubjectsId" FOREIGN KEY ("DifficultSubjectsId") REFERENCES "Subjects" ("Id")
);

CREATE INDEX "IX_MentorSubject_SpecialtiesId" ON "MentorSubject" ("SpecialtiesId");

CREATE INDEX "IX_Schedulings_SubjectId" ON "Schedulings" ("SubjectId");

CREATE INDEX "IX_StudentSubject_StudentsId" ON "StudentSubject" ("StudentsId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20231005012648_Initial', '7.0.9');

COMMIT;

