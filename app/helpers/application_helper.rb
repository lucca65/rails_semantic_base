module ApplicationHelper
  def active_menu(link_path, other_classes = nil)
    class_name = current_page?(link_path) ? ' orange active' : ''

    "#{class_name} #{other_classes}" unless other_classes.nil?
  end

  def show_link(object, content = 'Show')
    link_to(content, object) if can?(:read, object)
  end

  def edit_link(object, content = 'Edit')
    link_to(content, [:edit, object]) if can?(:update, object)
  end

  def destroy_link(object, content = 'Destroy')
    if can?(:destroy, object)
      link_to(content, object, method: :delete, confirm: t('delete.message'))
    end
  end

  def create_link(object, content = 'New')
    if can?(:create, object)
      object_class = (object.kind_of?(Class) ? object : object.class)
      link_to(content, [:new, object_class.name.underscore.to_sym])
    end
  end
end
