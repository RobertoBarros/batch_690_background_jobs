class Product < ApplicationRecord

  validates :url, presence: true
  after_create :scrape

  private

  def scrape
    ScrapeJob.perform_later(self)
  end
end
