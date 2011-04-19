class UserExporter
  include ExportToSpreadsheet

  # Actually building the output file whatever the format
  def compose_export
    @doc.write do |d|
      d.title_1("Sample Title User Export").title_2("We are going to export the first #{@records_nb_to_export} users")
      d.title_3("Date : " + Date.today.to_s)
      d.newline.newline.freezepane
      keys_array =  ["First Name", "Last Name"]
      values     =  []
      User.all.each_with_index do |user,i|
        if i < @records_nb_to_export.to_i
          values     <<  [user.first_name, user.last_name]
        else
          break
        end
      end
      d.h_table(values, keys_array, {:border_bottom => true})
      d.newline.newline
    end
    @doc.save
  end

end