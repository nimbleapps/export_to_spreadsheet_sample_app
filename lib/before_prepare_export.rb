module ExportToSpreadsheet

  # Configures export before generating a document
  def before_prepare_export_first(target, options = {})
    @records_nb_to_export   = (options && ! options.empty?) ? options.delete(:records_nb_to_export)   : nil
    return options
  end

end