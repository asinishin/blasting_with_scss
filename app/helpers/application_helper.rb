module ApplicationHelper

  # http://stackoverflow.com/questions/8790093/how-to-pluralize-there-is-are-n-object-objects
  def pluralize_sentence(count, i18n_id, plural_i18n_id = nil)
    if count == 1
      I18n.t(i18n_id, :count => count)
    elsif count == 0 && i18n_set?(i18n_id + "_none")
      I18n.t(i18n_id + "_none")
    else
      I18n.t(plural_i18n_id || (i18n_id + "_plural"), :count => count)
    end
  end

  # http://stackoverflow.com/a/7756320/582294
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : ''

    # content_tag(:li, :class => class_name) do
    link_to link_text, link_path, :class => class_name
    # end
  end

  def capitalized(str)
    str.try(:downcase).try(:capitalize)
  end

  def admin?
    current_user && current_user.admin?
  end

  def i18n_set? key
    I18n.t key, :raise => true rescue false
  end

  def tenant_domain
    domain = Domain.where(tenant: current_tenant).first
    names = []
    names << domain.name if domain.try(:name)
    names << domain.ext if domain.try(:ext)
    names.join('.')
  end
end
