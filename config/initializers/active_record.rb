class ActiveRecord::Base

  # Returns ActiveRecord relation that contains only callee instance.
  #
  # @return [ActiveRecord::Relation]
  def rel
    self.class.where(id: id)
  end

end
