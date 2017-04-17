ThinkingSphinx::Index.define :article, :with => :active_record do
  # fields
  indexes title, :sortable => true
  indexes country, :sortable => true
  indexes keywords
  indexes title_rus, :sortable => true
  indexes category, :sortable => true
  indexes lang, :sortable => true
  indexes text
end