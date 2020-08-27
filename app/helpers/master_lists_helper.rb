module MasterListsHelper

  def archive_icon(master_list)
  	if master_list.archived?
  	  icon_link('toggle-on', 'Enable')
  	else
  	  icon_link('archive', 'Archive')
  	end
  end

  def master_list_delete_term(master_list)
  	return 'enable' if master_list.archived?
  	'archive'
  end
end
