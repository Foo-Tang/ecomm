require 'csv'
require 'net/http'

Taxcode.destroy_all
Productorder.destroy_all
Order.destroy_all
Customer.destroy_all
Province.destroy_all
Wrestlerproduct.destroy_all
Product.destroy_all
Wrestler.destroy_all
Producttype.destroy_all
AdminUser.destroy_all

json_data = File.read(Rails.root.join('db/provs.json'))
parse_data = JSON.parse(json_data)

parse_data.each do |ab, name|
  Province.create(name: name, abbr: ab)
end

url = 'https://api.salestaxapi.ca/v2/province/all'
uri = URI(url)
response = Net::HTTP.get(uri)
tax_data = JSON.parse(response)

tax_data.each do |key, value|
  tax = Taxcode.create(province: key, pst: value['pst'], hst: value['hst'], gst: value['gst'], applicable: value['applicable'])
end

file = Rails.root.join('db/data4.csv')
csv_data = File.read(file)
data = CSV.parse(csv_data, headers:true, encoding: 'UTF-8')

data.each do |row|
  producttype = Producttype.find_or_create_by(name: row['category'])

  wrestler = Wrestler.find_or_create_by(name: row['name'])

  if producttype.valid? && wrestler.valid?
    product = Product.find_or_initialize_by(name: row['product'].strip) do |p|
      if p.price.blank?
        p.producttype = producttype
        p.price = row['price']
        p.stocklevel = rand(5..100)
        p.save
      end
    end
     Wrestlerproduct.create(wrestler: wrestler, product: product)
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?