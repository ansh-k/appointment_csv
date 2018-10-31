class HomeController < ActionController::Base

  def index
    
  end

  def create_csv

    @csv = CsvService.create 
    send_data @csv, filename: "clients-#{Date.today}.csv"
  end
end