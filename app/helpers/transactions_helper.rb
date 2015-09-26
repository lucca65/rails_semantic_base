module TransactionsHelper
  def selected_status(params)
    return params[:q][:status_eq] rescue ''
  end

  def status_options(params)
    options_for_select([
      [t('.all'), ['S', 'F']],
        [t('.success'), 'S'],
        [t('.failure'), 'F']
    ], selected_status(params))
  end

  def transaction_type_options(admin_user, params)
    types = admin_user.transaction_types.map do |type|
      [type.description, type.id]
    end

    types.sort! { |a,b| a[0] <=> b[0] }

    # create a array with type id only is necessary because of a bug in
    # semantic-ui dropdown which its not possible to set a option with blank value
    types.insert(0, [t('.all'), types.map{ |t| t[1].to_s }])

    selected_option = params[:q][:idType_eq] rescue ''
    options_for_select(types, selected_option)
  end
end
