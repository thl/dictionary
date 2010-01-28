class String

  def to_c
    eval(self) rescue nil
  end

  def modelize
    test = self.singularize.camelize.to_c
    test if test && (test < ActiveRecord::Base)
  end

end
