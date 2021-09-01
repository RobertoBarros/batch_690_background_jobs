namespace :product do
  desc "TODO"
  task update_all: :environment do

    Product.all.each do |product|
      ScrapeJob.perform_later(product)
    end

  end

end
