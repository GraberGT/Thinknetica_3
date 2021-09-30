ThinkingSphinx::Index.define :answer, with: :active_record do
  # fields
  indexes title
  indexes user.email, as: :author, sortable: true

  # attributes
  has question_id, user_id, created_at, updated_at
end
