# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110912110234) do

  create_table "bdrb_job_queues", :force => true do |t|
    t.binary   "args"
    t.string   "worker_name"
    t.string   "worker_method"
    t.string   "job_key"
    t.integer  "taken"
    t.integer  "finished"
    t.integer  "timeout"
    t.integer  "priority"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.string   "tag"
    t.string   "submitter_info"
    t.string   "runner_info"
    t.string   "worker_key"
    t.datetime "scheduled_at"
  end

  create_table "category_etymology_associations", :force => true do |t|
    t.integer  "etymology_id"
    t.integer  "category_branch_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_pronunciation_associations", :force => true do |t|
    t.integer  "pronunciation_id"
    t.integer  "category_branch_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_spelling_associations", :force => true do |t|
    t.integer  "spelling_id"
    t.integer  "category_branch_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_translation_associations", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "category_branch_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_translation_equivalent_associations", :force => true do |t|
    t.integer  "translation_equivalent_id"
    t.integer  "category_branch_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "definition_category_associations", :force => true do |t|
    t.integer  "definition_id"
    t.integer  "category_branch_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "definition_definition_forms", :force => true do |t|
    t.integer "def1_id"
    t.integer "def2_id"
    t.string  "role",              :limit => 128
    t.string  "created_by",        :limit => 80
    t.string  "created_at",        :limit => 80
    t.string  "updated_by",        :limit => 80
    t.string  "updated_at",        :limit => 80
    t.text    "update_history"
    t.string  "relationship_to",   :limit => 256
    t.string  "relationship_from", :limit => 256
  end

  create_table "definition_definitions", :force => true do |t|
    t.integer "def1_id"
    t.integer "def2_id"
    t.string  "created_by",     :limit => 80
    t.string  "created_at",     :limit => 80
    t.string  "updated_by",     :limit => 80
    t.string  "updated_at",     :limit => 80
    t.text    "update_history"
  end

  create_table "definition_full_synonyms", :id => false, :force => true do |t|
    t.integer "definition_id"
    t.integer "full_synonym_id"
  end

  create_table "definitions", :force => true do |t|
    t.string  "term"
    t.string  "level",                           :limit => 80
    t.text    "definition"
    t.string  "language",                        :limit => 80
    t.string  "thematic_classification",         :limit => 80
    t.string  "tense",                           :limit => 128
    t.string  "encyclopedia_entry",              :limit => 1024
    t.string  "grammatical_function",            :limit => 80
    t.string  "register",                        :limit => 80
    t.string  "language_context",                :limit => 256
    t.integer "numerology"
    t.string  "major_dialect_family",            :limit => 80
    t.string  "specific_dialect",                :limit => 80
    t.string  "literary_genre",                  :limit => 80
    t.string  "literary_period",                 :limit => 80
    t.string  "literary_form",                   :limit => 80
    t.string  "image",                           :limit => 256
    t.string  "image_caption",                   :limit => 256
    t.string  "image_photographer",              :limit => 128
    t.string  "image_link",                      :limit => 256
    t.string  "image_description",               :limit => 512
    t.string  "audio",                           :limit => 120
    t.string  "audio_id_number",                 :limit => 120
    t.string  "audio_speaker",                   :limit => 120
    t.string  "audio_date",                      :limit => 80
    t.string  "audio_place_of_recording",        :limit => 120
    t.string  "audio_link",                      :limit => 256
    t.string  "video",                           :limit => 120
    t.string  "video_id_number",                 :limit => 120
    t.string  "video_speaker",                   :limit => 120
    t.string  "video_date",                      :limit => 80
    t.string  "video_place_of_recording",        :limit => 120
    t.string  "video_link",                      :limit => 256
    t.string  "analytical_note",                 :limit => 512
    t.string  "created_by",                      :limit => 80
    t.string  "created_at",                      :limit => 80
    t.string  "updated_by",                      :limit => 80
    t.string  "updated_at",                      :limit => 80
    t.text    "update_history"
    t.text    "audio_description"
    t.text    "video_description"
    t.integer "grammatical_function_type_id"
    t.integer "language_type_id"
    t.integer "register_type_id"
    t.integer "language_context_type_id"
    t.integer "literary_genre_type_id"
    t.integer "literary_period_type_id"
    t.integer "literary_form_type_id"
    t.integer "major_dialect_family_type_id"
    t.integer "thematic_classification_type_id"
    t.string  "wylie"
    t.string  "phonetic"
    t.integer "sort_order"
    t.integer "root_letter_id"
  end

  add_index "definitions", ["term"], :name => "term_index"

  create_table "definitions_literary_quotations", :id => false, :force => true do |t|
    t.integer "definition_id"
    t.integer "literary_quotation_id"
  end

  create_table "definitions_model_sentences", :id => false, :force => true do |t|
    t.integer "definition_id"
    t.integer "model_sentence_id"
  end

  create_table "definitions_oral_quotations", :id => false, :force => true do |t|
    t.integer "definition_id"
    t.integer "oral_quotation_id"
  end

  create_table "definitions_thematic_classifications", :id => false, :force => true do |t|
    t.integer "def_id"
    t.integer "theme_id"
  end

  create_table "derivations", :force => true do |t|
    t.string "derivation",     :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "etymologies", :force => true do |t|
    t.text    "etymology"
    t.string  "etymology_type",               :limit => 128
    t.string  "loan_language",                :limit => 80
    t.string  "derivation",                   :limit => 80
    t.string  "major_dialect_family",         :limit => 80
    t.string  "specific_dialect",             :limit => 80
    t.string  "literary_genre",               :limit => 80
    t.string  "literary_period",              :limit => 80
    t.string  "literary_form",                :limit => 80
    t.string  "image",                        :limit => 256
    t.string  "image_caption",                :limit => 256
    t.string  "image_photographer",           :limit => 128
    t.string  "image_link",                   :limit => 256
    t.string  "image_description",            :limit => 512
    t.string  "audio",                        :limit => 120
    t.string  "audio_id_number",              :limit => 120
    t.string  "audio_speaker",                :limit => 120
    t.string  "audio_date",                   :limit => 80
    t.string  "audio_place_of_recording",     :limit => 120
    t.string  "audio_link",                   :limit => 256
    t.string  "video",                        :limit => 120
    t.string  "video_id_number",              :limit => 120
    t.string  "video_speaker",                :limit => 120
    t.string  "video_date",                   :limit => 80
    t.string  "video_place_of_recording",     :limit => 120
    t.string  "video_link",                   :limit => 256
    t.string  "analytical_note",              :limit => 512
    t.integer "definition_id"
    t.string  "created_by",                   :limit => 80
    t.string  "created_at",                   :limit => 80
    t.string  "updated_by",                   :limit => 80
    t.string  "updated_at",                   :limit => 80
    t.text    "update_history"
    t.text    "video_description"
    t.text    "audio_description"
    t.integer "loan_language_type_id"
    t.integer "major_dialect_family_type_id"
    t.integer "literary_genre_type_id"
    t.integer "literary_period_type_id"
    t.integer "literary_form_type_id"
    t.integer "etymology_category_id"
    t.integer "derivation_type_id"
  end

  create_table "etymology_types", :force => true do |t|
    t.string "etymology_type", :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "full_synonyms", :force => true do |t|
    t.string "term",           :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "grammar_function_level_ones", :force => true do |t|
    t.string "grammar_function", :limit => 128
    t.string "created_by",       :limit => 80
    t.string "created_at",       :limit => 80
    t.string "updated_by",       :limit => 80
    t.string "updated_at",       :limit => 80
    t.text   "update_history"
  end

  create_table "grammar_function_level_threes", :force => true do |t|
    t.integer "grammar_function_id"
    t.string  "grammar_function",    :limit => 128
    t.string  "created_by",          :limit => 80
    t.string  "created_at",          :limit => 80
    t.string  "updated_by",          :limit => 80
    t.string  "updated_at",          :limit => 80
    t.text    "update_history"
  end

  create_table "grammar_function_level_twos", :force => true do |t|
    t.integer "grammar_function_id"
    t.string  "grammar_function",    :limit => 128
    t.string  "created_by",          :limit => 80
    t.string  "created_at",          :limit => 80
    t.string  "updated_by",          :limit => 80
    t.string  "updated_at",          :limit => 80
    t.text    "update_history"
  end

  create_table "groups", :force => true do |t|
    t.string "group_name",      :limit => 80
    t.string "analytical_note", :limit => 512
    t.string "created_by",      :limit => 80
    t.string "created_at",      :limit => 80
    t.string "updated_by",      :limit => 80
    t.string "updated_at",      :limit => 80
    t.text   "update_history"
  end

  create_table "language_contexts", :force => true do |t|
    t.string "language_context", :limit => 80
    t.string "created_by",       :limit => 80
    t.string "created_at",       :limit => 80
    t.string "updated_by",       :limit => 80
    t.string "updated_at",       :limit => 80
    t.text   "update_history"
  end

  create_table "languages", :force => true do |t|
    t.string "language",       :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "literary_forms", :force => true do |t|
    t.string "literary_form",  :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "literary_genres", :force => true do |t|
    t.string  "literary_genre", :limit => 512
    t.string  "created_by",     :limit => 80
    t.string  "created_at",     :limit => 80
    t.string  "updated_by",     :limit => 80
    t.string  "updated_at",     :limit => 80
    t.text    "update_history"
    t.integer "parent_id"
  end

  create_table "literary_periods", :force => true do |t|
    t.string "literary_period", :limit => 80
    t.string "created_by",      :limit => 80
    t.string "created_at",      :limit => 80
    t.string "updated_by",      :limit => 80
    t.string "updated_at",      :limit => 80
    t.text   "update_history"
  end

  create_table "literary_quotations", :force => true do |t|
    t.string  "source",                          :limit => 256
    t.string  "source_id",                       :limit => 128
    t.string  "title",                           :limit => 128
    t.string  "author",                          :limit => 128
    t.string  "western_date",                    :limit => 128
    t.string  "western_date_note",               :limit => 1025
    t.string  "tibetan_date",                    :limit => 128
    t.string  "tibetan_date_note",               :limit => 1025
    t.string  "edition",                         :limit => 128
    t.string  "literary_genre",                  :limit => 128
    t.string  "isbn",                            :limit => 128
    t.string  "publisher",                       :limit => 128
    t.string  "place_of_publication",            :limit => 128
    t.string  "published_date",                  :limit => 128
    t.string  "volume_number",                   :limit => 128
    t.string  "literary_period",                 :limit => 80
    t.string  "literary_form",                   :limit => 80
    t.text    "passage"
    t.string  "script",                          :limit => 256
    t.string  "language_of_translation",         :limit => 80
    t.integer "passage_pound"
    t.string  "passage_number",                  :limit => 128
    t.string  "page_side",                       :limit => 80
    t.string  "line_number",                     :limit => 80
    t.string  "line_id",                         :limit => 256
    t.string  "url",                             :limit => 256
    t.string  "page_image_link",                 :limit => 256
    t.string  "spelling",                        :limit => 256
    t.string  "image",                           :limit => 256
    t.text    "image_caption"
    t.string  "image_photographer",              :limit => 80
    t.string  "image_link",                      :limit => 256
    t.text    "image_description"
    t.string  "audio",                           :limit => 120
    t.string  "audio_id_number",                 :limit => 120
    t.string  "audio_speaker",                   :limit => 120
    t.string  "audio_date",                      :limit => 80
    t.string  "audio_place_of_recording",        :limit => 120
    t.string  "audio_link",                      :limit => 256
    t.string  "video",                           :limit => 120
    t.string  "video_id_number",                 :limit => 120
    t.string  "video_speaker",                   :limit => 120
    t.string  "video_date",                      :limit => 80
    t.string  "video_place_of_recording",        :limit => 120
    t.string  "video_link",                      :limit => 256
    t.string  "analytical_note",                 :limit => 512
    t.integer "def_id"
    t.string  "created_by",                      :limit => 80
    t.string  "created_at",                      :limit => 80
    t.string  "updated_by",                      :limit => 80
    t.string  "updated_at",                      :limit => 80
    t.text    "update_history"
    t.text    "video_description"
    t.text    "audio_description"
    t.integer "literary_genre_type_id"
    t.integer "literary_period_type_id"
    t.integer "literary_form_type_id"
    t.integer "language_of_translation_type_id"
    t.integer "script_type_id"
  end

  create_table "loan_languages", :force => true do |t|
    t.string "language",       :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "major_dialects", :force => true do |t|
    t.string "name",           :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "meta_source", :id => false, :force => true do |t|
    t.integer "meta_id"
    t.integer "source_id"
  end

  create_table "metas", :force => true do |t|
    t.string  "project",                       :limit => 120
    t.string  "source",                        :limit => 120
    t.string  "source_type",                   :limit => 80
    t.string  "metadata_note",                 :limit => 512
    t.integer "precedence"
    t.integer "definition_id"
    t.integer "translation_id"
    t.integer "translation_equivalent_id"
    t.integer "etymology_id"
    t.integer "spelling_id"
    t.integer "literary_quotation_id"
    t.integer "pronunciation_id"
    t.integer "oral_quotation_id"
    t.integer "group_id"
    t.integer "model_sentence_id"
    t.integer "full_synonym_id"
    t.string  "created_by",                    :limit => 80
    t.string  "created_at",                    :limit => 80
    t.string  "updated_at",                    :limit => 80
    t.string  "updated_by",                    :limit => 80
    t.text    "update_history"
    t.string  "title",                         :limit => 512
    t.string  "author",                        :limit => 512
    t.string  "page_number",                   :limit => 128
    t.string  "date_of_publication",           :limit => 128
    t.string  "publisher",                     :limit => 128
    t.string  "place_of_publication",          :limit => 128
    t.string  "language",                      :limit => 120
    t.integer "definition_definition_form_id"
    t.integer "project_type_id"
    t.integer "language_type_id"
  end

  create_table "model_sentence_types", :force => true do |t|
    t.string "sentence_type",  :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "model_sentences", :force => true do |t|
    t.text    "model_sentence"
    t.string  "language",                     :limit => 80
    t.string  "sentence_type",                :limit => 80
    t.string  "source",                       :limit => 256
    t.string  "spelling",                     :limit => 80
    t.string  "major_dialect_family",         :limit => 80
    t.string  "specific_dialect",             :limit => 80
    t.string  "literary_genre",               :limit => 80
    t.string  "literary_period",              :limit => 80
    t.string  "literary_form",                :limit => 80
    t.string  "image",                        :limit => 256
    t.text    "image_caption"
    t.string  "image_photographer",           :limit => 80
    t.string  "image_link",                   :limit => 256
    t.text    "image_description"
    t.string  "audio",                        :limit => 120
    t.string  "audio_id_number",              :limit => 120
    t.string  "audio_speaker",                :limit => 120
    t.string  "audio_date",                   :limit => 80
    t.string  "audio_place_of_recording",     :limit => 120
    t.string  "audio_link",                   :limit => 256
    t.string  "video",                        :limit => 120
    t.string  "video_id_number",              :limit => 120
    t.string  "video_speaker",                :limit => 120
    t.string  "video_date",                   :limit => 80
    t.string  "video_place_of_recording",     :limit => 120
    t.string  "video_link",                   :limit => 256
    t.string  "analytical_note",              :limit => 512
    t.integer "def_id"
    t.string  "created_by",                   :limit => 80
    t.string  "created_at",                   :limit => 80
    t.string  "updated_by",                   :limit => 80
    t.string  "updated_at",                   :limit => 80
    t.text    "update_history"
    t.text    "video_description"
    t.text    "audio_description"
    t.integer "literary_form_type_id"
    t.integer "literary_period_type_id"
    t.integer "literary_genre_type_id"
    t.integer "major_dialect_family_type_id"
    t.integer "language_type_id"
  end

  create_table "old_definitions", :force => true do |t|
    t.string  "term",                 :limit => 256
    t.text    "definition"
    t.string  "dictionary",           :limit => 256
    t.string  "url",                  :limit => 256
    t.text    "notes"
    t.string  "created_at",           :limit => 80
    t.string  "created_by",           :limit => 80
    t.string  "updated_by",           :limit => 80
    t.string  "updated_at",           :limit => 80
    t.text    "update_history"
    t.string  "level",                :limit => 80
    t.string  "grammatical_function", :limit => 512, :default => ""
    t.integer "thdl_id"
  end

  add_index "old_definitions", ["dictionary", "term"], :name => "old_dictionary_index"
  add_index "old_definitions", ["term"], :name => "od_idx"

  create_table "oral_quotations", :force => true do |t|
    t.string  "source",                         :limit => 120
    t.string  "source_id",                      :limit => 256
    t.string  "source_title",                   :limit => 120
    t.string  "source_speaker",                 :limit => 120
    t.string  "source_speaker_dialect",         :limit => 120
    t.string  "source_speech_type",             :limit => 120
    t.string  "source_location_within_title",   :limit => 120
    t.string  "source_speech_context",          :limit => 120
    t.string  "source_speech_date",             :limit => 120
    t.string  "source_speech_date_tibetan",     :limit => 120
    t.string  "source_speech_date_western",     :limit => 120
    t.string  "source_location_of_speech",      :limit => 120
    t.string  "source_type",                    :limit => 80
    t.string  "transcript_in_tibetan",          :limit => 256
    t.string  "translation_of_transcript",      :limit => 256
    t.string  "time_line_id",                   :limit => 120
    t.string  "image",                          :limit => 256
    t.text    "image_caption"
    t.string  "image_photographer",             :limit => 80
    t.string  "image_link",                     :limit => 256
    t.text    "image_description"
    t.string  "audio",                          :limit => 120
    t.string  "audio_id_number",                :limit => 120
    t.string  "audio_speaker",                  :limit => 120
    t.string  "audio_date",                     :limit => 80
    t.string  "audio_place_of_recording",       :limit => 120
    t.string  "audio_link",                     :limit => 256
    t.string  "video",                          :limit => 120
    t.string  "video_id_number",                :limit => 120
    t.string  "video_speaker",                  :limit => 120
    t.string  "video_date",                     :limit => 80
    t.string  "video_place_of_recording",       :limit => 120
    t.string  "video_link",                     :limit => 256
    t.string  "analytical_note",                :limit => 512
    t.integer "def_id"
    t.string  "created_by",                     :limit => 80
    t.string  "created_at",                     :limit => 80
    t.string  "updated_by",                     :limit => 80
    t.string  "updated_at",                     :limit => 80
    t.text    "update_history"
    t.text    "audio_description"
    t.text    "video_description"
    t.integer "source_speaker_dialect_type_id"
  end

  create_table "projects", :force => true do |t|
    t.string "project",        :limit => 512
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "pronunciation_types", :force => true do |t|
    t.string "pronunciation_type", :limit => 80
    t.string "created_by",         :limit => 80
    t.string "created_at",         :limit => 80
    t.string "updated_by",         :limit => 80
    t.string "updated_at",         :limit => 80
    t.text   "update_history"
  end

  create_table "pronunciations", :force => true do |t|
    t.string  "phonetic_transliteration",     :limit => 256
    t.string  "pronunciation_type",           :limit => 80
    t.string  "major_dialect_family",         :limit => 80
    t.string  "specific_dialect",             :limit => 80
    t.string  "literary_genre",               :limit => 80
    t.string  "literary_period",              :limit => 80
    t.string  "literary_form",                :limit => 80
    t.string  "image",                        :limit => 256
    t.text    "image_caption"
    t.string  "image_photographer",           :limit => 80
    t.string  "image_link",                   :limit => 256
    t.text    "image_description"
    t.string  "audio",                        :limit => 120
    t.string  "audio_id_number",              :limit => 120
    t.string  "audio_speaker",                :limit => 120
    t.string  "audio_date",                   :limit => 80
    t.string  "audio_place_of_recording",     :limit => 120
    t.string  "audio_link",                   :limit => 256
    t.string  "video",                        :limit => 120
    t.string  "video_id_number",              :limit => 120
    t.string  "video_speaker",                :limit => 120
    t.string  "video_date",                   :limit => 80
    t.string  "video_place_of_recording",     :limit => 120
    t.string  "video_link",                   :limit => 256
    t.string  "analytical_note",              :limit => 512
    t.integer "def_id"
    t.string  "created_by",                   :limit => 80
    t.string  "created_at",                   :limit => 80
    t.string  "updated_by",                   :limit => 80
    t.string  "updated_at",                   :limit => 80
    t.text    "update_history"
    t.text    "audio_description"
    t.text    "video_description"
    t.integer "major_dialect_family_type_id"
    t.integer "literary_form_type_id"
    t.integer "literary_period_type_id"
    t.integer "literary_genre_type_id"
    t.integer "pronunciation_category_id"
  end

  create_table "registers", :force => true do |t|
    t.string "register",       :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "related_definitions", :id => false, :force => true do |t|
    t.integer "def1_id"
    t.integer "def2_id"
  end

  create_table "scripts", :force => true do |t|
    t.string "script",         :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "source_types", :force => true do |t|
    t.string "source_type",    :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "sources", :force => true do |t|
    t.string "source_id_value",   :limit => 256
    t.string "source_type",       :limit => 256
    t.string "page_number",       :limit => 256
    t.text   "source_note"
    t.string "created_by",        :limit => 80
    t.string "created_at",        :limit => 80
    t.string "updated_by",        :limit => 80
    t.string "updated_at",        :limit => 80
    t.text   "update_history"
    t.string "volume_number",     :limit => 128
    t.string "start_page_side",   :limit => 128
    t.string "start_line_number", :limit => 128
    t.string "end_page_number",   :limit => 128
    t.string "end_page_side",     :limit => 128
    t.string "end_line_number",   :limit => 128
    t.string "spelling",          :limit => 512
  end

  create_table "specific_dialects", :force => true do |t|
    t.string  "name",             :limit => 80
    t.integer "major_dialect_id"
    t.string  "created_by",       :limit => 80
    t.string  "created_at",       :limit => 80
    t.string  "updated_by",       :limit => 80
    t.string  "updated_at",       :limit => 80
    t.text    "update_history"
  end

  create_table "spelling_major_dialects", :force => true do |t|
    t.string "name",           :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "spelling_specific_dialects", :force => true do |t|
    t.string  "name",             :limit => 80
    t.integer "major_dialect_id"
    t.string  "created_by",       :limit => 80
    t.string  "created_at",       :limit => 80
    t.string  "updated_by",       :limit => 80
    t.string  "updated_at",       :limit => 80
    t.text    "update_history"
  end

  create_table "spellings", :force => true do |t|
    t.string  "spelling",                     :limit => 80
    t.string  "basis_of_spelling",            :limit => 80
    t.string  "spelling_type",                :limit => 80
    t.string  "specific_dialect",             :limit => 80
    t.string  "literary_genre",               :limit => 80
    t.string  "literary_period",              :limit => 80
    t.string  "literary_form",                :limit => 80
    t.string  "image",                        :limit => 256
    t.string  "image_caption",                :limit => 256
    t.string  "image_photographer",           :limit => 128
    t.string  "image_link",                   :limit => 256
    t.string  "image_description",            :limit => 512
    t.string  "audio",                        :limit => 120
    t.string  "audio_id_number",              :limit => 120
    t.string  "audio_speaker",                :limit => 120
    t.string  "audio_date",                   :limit => 80
    t.string  "audio_place_of_recording",     :limit => 120
    t.string  "audio_link",                   :limit => 256
    t.string  "video",                        :limit => 120
    t.string  "video_id_number",              :limit => 120
    t.string  "video_speaker",                :limit => 120
    t.string  "video_date",                   :limit => 80
    t.string  "video_place_of_recording",     :limit => 120
    t.string  "video_link",                   :limit => 256
    t.string  "analytical_note",              :limit => 512
    t.integer "definition_id"
    t.string  "created_by",                   :limit => 80
    t.string  "created_at",                   :limit => 80
    t.string  "updated_by",                   :limit => 80
    t.string  "updated_at",                   :limit => 80
    t.text    "update_history"
    t.text    "audio_description"
    t.text    "video_description"
    t.string  "major_dialect_family",         :limit => 256
    t.integer "literary_genre_type_id"
    t.integer "literary_period_type_id"
    t.integer "literary_form_type_id"
    t.integer "major_dialect_family_type_id"
    t.integer "basis_of_spelling_type_id"
    t.integer "spelling_category_id"
  end

  create_table "term_types", :force => true do |t|
    t.string "term_type",      :limit => 80
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "thematic_classifications", :force => true do |t|
    t.string "level1",         :limit => 128
    t.string "level2",         :limit => 128
    t.string "level3",         :limit => 128
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "theme_level_ones", :force => true do |t|
    t.string "theme",          :limit => 128
    t.string "created_by",     :limit => 80
    t.string "created_at",     :limit => 80
    t.string "updated_by",     :limit => 80
    t.string "updated_at",     :limit => 80
    t.text   "update_history"
  end

  create_table "theme_level_threes", :force => true do |t|
    t.integer "theme_id"
    t.string  "theme",          :limit => 128
    t.string  "created_by",     :limit => 80
    t.string  "created_at",     :limit => 80
    t.string  "updated_by",     :limit => 80
    t.string  "updated_at",     :limit => 80
    t.text    "update_history"
  end

  create_table "theme_level_twos", :force => true do |t|
    t.integer "theme_id"
    t.string  "theme",          :limit => 128
    t.string  "created_by",     :limit => 80
    t.string  "created_at",     :limit => 80
    t.string  "updated_by",     :limit => 80
    t.string  "updated_at",     :limit => 80
    t.text    "update_history"
  end

  create_table "translation_equivalents", :force => true do |t|
    t.text    "translation_equivalent"
    t.string  "language",                 :limit => 80,  :default => "English"
    t.string  "image",                    :limit => 256
    t.text    "image_caption"
    t.string  "image_photographer",       :limit => 80
    t.string  "image_link",               :limit => 256
    t.text    "image_description"
    t.string  "audio",                    :limit => 120
    t.string  "audio_id_number",          :limit => 120
    t.string  "audio_speaker",            :limit => 120
    t.string  "audio_date",               :limit => 80
    t.string  "audio_place_of_recording", :limit => 120
    t.string  "audio_link",               :limit => 256
    t.string  "video",                    :limit => 120
    t.string  "video_id_number",          :limit => 120
    t.string  "video_speaker",            :limit => 120
    t.string  "video_date",               :limit => 80
    t.string  "video_place_of_recording", :limit => 120
    t.string  "video_link",               :limit => 256
    t.string  "analytical_note",          :limit => 512
    t.integer "def_id"
    t.string  "created_by",               :limit => 80
    t.string  "created_at",               :limit => 80
    t.string  "updated_by",               :limit => 80
    t.string  "updated_at",               :limit => 80
    t.text    "update_history"
    t.integer "language_type_id"
  end

  create_table "translations", :force => true do |t|
    t.text    "translation"
    t.string  "language",              :limit => 80
    t.string  "analytical_note",       :limit => 1024
    t.integer "definition_id"
    t.integer "etymology_id"
    t.integer "literary_quotation_id"
    t.integer "oral_quotation_id"
    t.integer "model_sentence_id"
    t.string  "created_by",            :limit => 80
    t.string  "created_at",            :limit => 80
    t.string  "updated_by",            :limit => 80
    t.string  "updated_at",            :limit => 80
    t.text    "update_history"
    t.integer "language_type_id"
  end

  create_table "users", :force => true do |t|
    t.string "login",     :limit => 80
    t.string "password",  :limit => 80
    t.string "full_name", :limit => 128, :default => "THDL"
  end

end
