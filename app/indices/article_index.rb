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




ThinkingSphinx::Index.define(
  :article, :name => 'ir_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'international relations'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'inf_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'investment and finance'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'pe_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'political events'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'wow_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'world of work'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'doc_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'documents'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'om_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'other materials'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'irr_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'международные отношения'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'infr_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'экономика'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'per_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'внутренняя политика'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'wowr_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'мир труда'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'docr_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'документы'"
end

ThinkingSphinx::Index.define(
  :article, :name => 'omr_ind', :with => :active_record
  ) do
    indexes keywords
    where "category = 'другие материалы'"
end