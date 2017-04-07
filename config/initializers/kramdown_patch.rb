Kramdown::Element.class_eval do
  def to_hash
    element_hash = value.try(:options) || {}
    element_hash.merge!(children: children.map(&:to_hash)) if children.any?
    element_hash
  end
end