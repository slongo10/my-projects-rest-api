PRAGMA defer_foreign_keys=TRUE;
CREATE TABLE IF NOT EXISTS "d1_migrations"(
		id         INTEGER PRIMARY KEY AUTOINCREMENT,
		name       TEXT UNIQUE,
		applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
INSERT INTO "d1_migrations" ("id","name","applied_at") VALUES(1,'0000_gifted_tigra.sql','2026-11-09 03:41:29');
INSERT INTO "d1_migrations" ("id","name","applied_at") VALUES(2,'0001_square_maginty.sql','2026-11-09 03:41:30');
INSERT INTO "d1_migrations" ("id","name","applied_at") VALUES(3,'0002_oval_doctor_faustus.sql','2026-11-09 03:41:30');
CREATE TABLE `projects` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`description` text DEFAULT '' NOT NULL,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL
);
INSERT INTO "projects" ("id","name","description","created_at","updated_at") VALUES(1,'New Project','Hello There','2026-11-09T03:53:49.971Z','2026-11-09T03:53:49.971Z');
INSERT INTO "projects" ("id","name","description","created_at","updated_at") VALUES(3,'Grading assignment','Instructor evaluation','2026-11-11T05:40:32.175Z','2026-11-11T05:40:32.175Z');
CREATE TABLE `tasks` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`project_id` integer NOT NULL,
	`title` text NOT NULL,
	`description` text DEFAULT '' NOT NULL,
	`status` text DEFAULT 'todo' NOT NULL,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL,
	FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON UPDATE no action ON DELETE cascade,
	CONSTRAINT "tasks_status_check" CHECK("tasks"."status" IN ('todo', 'in_progress', 'done'))
);
INSERT INTO "tasks" ("id","project_id","title","description","status","created_at","updated_at") VALUES(1,1,'New Task','New Task description','todo','2026-11-09T03:56:16.796Z','2026-11-09T03:56:16.796Z');
INSERT INTO "tasks" ("id","project_id","title","description","status","created_at","updated_at") VALUES(3,3,'Grading assignment','','todo','2026-11-11T05:40:32.362Z','2026-11-11T05:40:32.362Z');
CREATE TABLE `users` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`email` text NOT NULL,
	`password_hash` text NOT NULL,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL
);
INSERT INTO "users" ("id","email","password_hash","created_at","updated_at") VALUES(1,'hello@there.com','$2b$10$d967wfIxFbIjMU4HExkuBeGTu269k0inpQr1FSEczHnn6ccXst/XG','2026-11-09T03:51:59.470Z','2026-11-09T03:51:59.470Z');
INSERT INTO "users" ("id","email","password_hash","created_at","updated_at") VALUES(2,'rodolfo@roman.com','$2b$10$8TDp0sZ4CdN3ObH8TMPgY.eM0lw9Yiau82a2rhOEqNJDJzIe/Sg02','2026-11-11T05:40:27.904Z','2026-11-11T05:40:27.904Z');
CREATE TABLE `sessions` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_id` integer NOT NULL,
	`token_hash` text NOT NULL,
	`expires_at` text NOT NULL,
	`created_at` text NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('d1_migrations',3);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('users',2);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('sessions',2);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('projects',3);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('tasks',3);
CREATE INDEX `idx_tasks_project_id` ON `tasks` (`project_id`);
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);
CREATE UNIQUE INDEX `idx_users_emal` ON `users` (`email`);
CREATE UNIQUE INDEX `sessions_token_hash_unique` ON `sessions` (`token_hash`);
CREATE UNIQUE INDEX `idx_sessions_token_hash` ON `sessions` (`token_hash`);
CREATE INDEX `idx_sessions_user_id` ON `sessions` (`user_id`);
