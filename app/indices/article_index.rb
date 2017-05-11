ThinkingSphinx::Index.define(
  :article, :name => 'ind', :with => :active_record
  ) do
    # fields
    indexes title
    indexes country, :sortable => true
    indexes keywords
    indexes title_rus
    indexes category, :sortable => true
    indexes text
    indexes lang
    indexes date
    indexes src_url
    indexes author

    has created_at, updated_at, is_active
end

ThinkingSphinx::Index.define(
  :article, :name => 'rkwd_ind', :with => :active_record
  ) do
    indexes keywords
    where "lang = 'rus'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'ekwd_ind', :with => :active_record
  ) do
    indexes keywords
    where "lang = 'eng'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'kwd_ind', :with => :active_record
  ) do
    indexes keywords
end