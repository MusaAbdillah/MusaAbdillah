class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def index
      # Load the html to convert to PDF
      html = File.read("#{Rails.root}/public/example.html")
      # Create a new kit and define page size to be US letter
      kit = PDFKit.new(html, :page_size => 'Letter')
      # Load our stylesheet into the kit to have colors & formatting
      kit.stylesheets << "#{Rails.root}/public/styles.css"
      # Save the html to a PDF file
      kit.to_file("#{Rails.root}/public/example.pdf")
      # Render the html
      render :text => html
    end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

end
