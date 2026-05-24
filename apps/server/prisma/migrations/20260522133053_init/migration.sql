-- CreateEnum
CREATE TYPE "card_timing" AS ENUM ('before_move', 'after_move', 'anytime', 'turn_start');

-- CreateEnum
CREATE TYPE "match_status" AS ENUM ('waiting', 'active', 'finished', 'abandoned');

-- CreateEnum
CREATE TYPE "rule_preset_visibility" AS ENUM ('private', 'unlisted', 'public');

-- CreateEnum
CREATE TYPE "player_color" AS ENUM ('white', 'black');

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "email" VARCHAR(255),
    "password_hash" TEXT,
    "oauth_provider" VARCHAR(32),
    "oauth_sub" VARCHAR(255),
    "display_name" VARCHAR(64),
    "avatar_url" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "last_login_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sessions" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID NOT NULL,
    "token_hash" TEXT NOT NULL,
    "expires_at" TIMESTAMPTZ(6) NOT NULL,
    "user_agent" TEXT,
    "revoked_at" TIMESTAMPTZ(6),

    CONSTRAINT "sessions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "email_verification_tokens" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID NOT NULL,
    "token_hash" TEXT NOT NULL,
    "expires_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "email_verification_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "player_profiles" (
    "user_id" UUID NOT NULL,
    "bio" TEXT,
    "country_code" CHAR(2),
    "locale" VARCHAR(10) NOT NULL DEFAULT 'fr',
    "ui_preferences" JSONB,

    CONSTRAINT "player_profiles_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "player_progression" (
    "user_id" UUID NOT NULL,
    "xp" INTEGER NOT NULL DEFAULT 0,
    "level" INTEGER NOT NULL DEFAULT 1,
    "rank_tier" VARCHAR(32),

    CONSTRAINT "player_progression_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "player_stats" (
    "user_id" UUID NOT NULL,
    "games_played" INTEGER NOT NULL DEFAULT 0,
    "wins" INTEGER NOT NULL DEFAULT 0,
    "losses" INTEGER NOT NULL DEFAULT 0,
    "draws" INTEGER NOT NULL DEFAULT 0,
    "cards_played" INTEGER NOT NULL DEFAULT 0,
    "total_play_time_sec" INTEGER NOT NULL DEFAULT 0,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "player_stats_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "ratings" (
    "user_id" UUID NOT NULL,
    "mode" VARCHAR(32) NOT NULL,
    "rating" INTEGER NOT NULL DEFAULT 1200,
    "games" INTEGER NOT NULL DEFAULT 0,
    "peak_rating" INTEGER NOT NULL DEFAULT 1200,

    CONSTRAINT "ratings_pkey" PRIMARY KEY ("user_id","mode")
);

-- CreateTable
CREATE TABLE "cards" (
    "id" VARCHAR(64) NOT NULL,
    "name" VARCHAR(128) NOT NULL,
    "description" TEXT,
    "pa_cost" SMALLINT NOT NULL,
    "timing" "card_timing" NOT NULL,
    "effect_key" VARCHAR(64) NOT NULL,
    "effect_params" JSONB NOT NULL,
    "rarity" VARCHAR(16),
    "is_starter" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "cards_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "passives" (
    "id" VARCHAR(64) NOT NULL,
    "name" VARCHAR(128) NOT NULL,
    "description" TEXT,
    "effect_key" VARCHAR(64) NOT NULL,
    "effect_params" JSONB NOT NULL,

    CONSTRAINT "passives_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "game_modes" (
    "id" VARCHAR(32) NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "config" JSONB NOT NULL,

    CONSTRAINT "game_modes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "achievements" (
    "id" VARCHAR(64) NOT NULL,
    "name" VARCHAR(128) NOT NULL,
    "criteria_key" VARCHAR(64) NOT NULL,
    "xp_reward" INTEGER NOT NULL,

    CONSTRAINT "achievements_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "unlocked_cards" (
    "user_id" UUID NOT NULL,
    "card_id" VARCHAR(64) NOT NULL,
    "unlocked_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "unlocked_cards_pkey" PRIMARY KEY ("user_id","card_id")
);

-- CreateTable
CREATE TABLE "unlocked_passives" (
    "user_id" UUID NOT NULL,
    "passive_id" VARCHAR(64) NOT NULL,
    "unlocked_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "unlocked_passives_pkey" PRIMARY KEY ("user_id","passive_id")
);

-- CreateTable
CREATE TABLE "user_achievements" (
    "user_id" UUID NOT NULL,
    "achievement_id" VARCHAR(64) NOT NULL,
    "earned_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_achievements_pkey" PRIMARY KEY ("user_id","achievement_id")
);

-- CreateTable
CREATE TABLE "decks" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "card_ids" JSONB NOT NULL,
    "is_default" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "decks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "loadouts" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "passive_ids" JSONB NOT NULL,
    "custom_rules" JSONB,
    "is_default" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "loadouts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "rule_presets" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "author_id" UUID NOT NULL,
    "name" VARCHAR(128) NOT NULL,
    "payload" JSONB NOT NULL,
    "visibility" "rule_preset_visibility" NOT NULL,
    "fork_count" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "rule_presets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "matches" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "mode" VARCHAR(32) NOT NULL,
    "status" "match_status" NOT NULL,
    "white_user_id" UUID NOT NULL,
    "black_user_id" UUID NOT NULL,
    "winner_user_id" UUID,
    "ended_reason" VARCHAR(32),
    "ranked" BOOLEAN NOT NULL DEFAULT false,
    "started_at" TIMESTAMPTZ(6),
    "ended_at" TIMESTAMPTZ(6),

    CONSTRAINT "matches_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "match_players" (
    "match_id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "color" "player_color" NOT NULL,
    "deck_id" UUID,
    "loadout_id" UUID,
    "elo_before" INTEGER,
    "elo_after" INTEGER,

    CONSTRAINT "match_players_pkey" PRIMARY KEY ("match_id","user_id")
);

-- CreateTable
CREATE TABLE "match_snapshots" (
    "match_id" UUID NOT NULL,
    "state" JSONB NOT NULL,
    "version" INTEGER NOT NULL DEFAULT 0,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "match_snapshots_pkey" PRIMARY KEY ("match_id")
);

-- CreateTable
CREATE TABLE "match_moves" (
    "id" BIGSERIAL NOT NULL,
    "match_id" UUID NOT NULL,
    "ply" INTEGER NOT NULL,
    "action_type" VARCHAR(32) NOT NULL,
    "action_payload" JSONB NOT NULL,
    "state_version" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "match_moves_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "private_rooms" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "code" CHAR(6) NOT NULL,
    "host_id" UUID NOT NULL,
    "mode" VARCHAR(32) NOT NULL,
    "rules" JSONB NOT NULL,
    "match_id" UUID,
    "expires_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "private_rooms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "matchmaking_queue" (
    "user_id" UUID NOT NULL,
    "mode" VARCHAR(32) NOT NULL,
    "rating" INTEGER NOT NULL,
    "loadout_id" UUID NOT NULL,
    "deck_id" UUID NOT NULL,
    "enqueued_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "matchmaking_queue_pkey" PRIMARY KEY ("user_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_oauth_provider_oauth_sub_key" ON "users"("oauth_provider", "oauth_sub");

-- CreateIndex
CREATE INDEX "ratings_mode_rating_idx" ON "ratings"("mode", "rating" DESC);

-- CreateIndex
CREATE INDEX "matches_status_idx" ON "matches"("status");

-- CreateIndex
CREATE INDEX "matches_white_user_id_black_user_id_idx" ON "matches"("white_user_id", "black_user_id");

-- CreateIndex
CREATE INDEX "match_moves_match_id_ply_idx" ON "match_moves"("match_id", "ply");

-- CreateIndex
CREATE UNIQUE INDEX "private_rooms_code_key" ON "private_rooms"("code");

-- CreateIndex
CREATE INDEX "matchmaking_queue_mode_rating_idx" ON "matchmaking_queue"("mode", "rating");

-- AddForeignKey
ALTER TABLE "sessions" ADD CONSTRAINT "sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "email_verification_tokens" ADD CONSTRAINT "email_verification_tokens_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "player_profiles" ADD CONSTRAINT "player_profiles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "player_progression" ADD CONSTRAINT "player_progression_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "player_stats" ADD CONSTRAINT "player_stats_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ratings" ADD CONSTRAINT "ratings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "unlocked_cards" ADD CONSTRAINT "unlocked_cards_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "unlocked_cards" ADD CONSTRAINT "unlocked_cards_card_id_fkey" FOREIGN KEY ("card_id") REFERENCES "cards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "unlocked_passives" ADD CONSTRAINT "unlocked_passives_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "unlocked_passives" ADD CONSTRAINT "unlocked_passives_passive_id_fkey" FOREIGN KEY ("passive_id") REFERENCES "passives"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_achievements" ADD CONSTRAINT "user_achievements_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_achievements" ADD CONSTRAINT "user_achievements_achievement_id_fkey" FOREIGN KEY ("achievement_id") REFERENCES "achievements"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "decks" ADD CONSTRAINT "decks_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "loadouts" ADD CONSTRAINT "loadouts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rule_presets" ADD CONSTRAINT "rule_presets_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matches" ADD CONSTRAINT "matches_mode_fkey" FOREIGN KEY ("mode") REFERENCES "game_modes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matches" ADD CONSTRAINT "matches_white_user_id_fkey" FOREIGN KEY ("white_user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matches" ADD CONSTRAINT "matches_black_user_id_fkey" FOREIGN KEY ("black_user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matches" ADD CONSTRAINT "matches_winner_user_id_fkey" FOREIGN KEY ("winner_user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match_players" ADD CONSTRAINT "match_players_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "matches"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match_players" ADD CONSTRAINT "match_players_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match_players" ADD CONSTRAINT "match_players_deck_id_fkey" FOREIGN KEY ("deck_id") REFERENCES "decks"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match_players" ADD CONSTRAINT "match_players_loadout_id_fkey" FOREIGN KEY ("loadout_id") REFERENCES "loadouts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match_snapshots" ADD CONSTRAINT "match_snapshots_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "matches"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "match_moves" ADD CONSTRAINT "match_moves_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "matches"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_rooms" ADD CONSTRAINT "private_rooms_host_id_fkey" FOREIGN KEY ("host_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "private_rooms" ADD CONSTRAINT "private_rooms_match_id_fkey" FOREIGN KEY ("match_id") REFERENCES "matches"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matchmaking_queue" ADD CONSTRAINT "matchmaking_queue_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matchmaking_queue" ADD CONSTRAINT "matchmaking_queue_loadout_id_fkey" FOREIGN KEY ("loadout_id") REFERENCES "loadouts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matchmaking_queue" ADD CONSTRAINT "matchmaking_queue_deck_id_fkey" FOREIGN KEY ("deck_id") REFERENCES "decks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
