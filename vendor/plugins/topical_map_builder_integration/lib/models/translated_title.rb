class TranslatedTitle < TopicalMapResource
  self.site = "#{self.site.to_s}#{Category.collection_name}/:#{Category.element_name}_id/"
end