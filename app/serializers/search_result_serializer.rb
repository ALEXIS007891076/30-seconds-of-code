class SearchResultSerializer < BaseSerializer
  attributes :title, :url, :tag, :search_tokens, :type

  alias_attribute :title, :short_title

  delegate :url, :search_tokens, :type, :short_title,
           to: :object

  def tag
    object.is_snippet? ? object.formatted_mini_preview_tag : object.formatted_snippet_count
  end
end
