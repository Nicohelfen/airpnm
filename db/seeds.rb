u1 = User.create!(email: "mail1@gmail.com", password: "pppppppp", password_confirmation: "pppppppp")
u2 = User.create!(email: "mail2@gmail.com", password: "pppppppp", password_confirmation: "pppppppp")
u3 = User.create!(email: "mail3@gmail.com", password: "pppppppp", password_confirmation: "pppppppp")
u4 = User.create!(email: "mail4@gmail.com", password: "pppppppp", password_confirmation: "pppppppp")
u5 = User.create!(email: "mail5@gmail.com", password: "pppppppp", password_confirmation: "pppppppp")

f1 = Flat.create!(owner: u1, name: "Manoire du Yeu", capacity: 8, city: "Ile d'yeu", street: "le marais salais", zip_code:"85350", description: "Magnifique maison individuelle au bord de mer", price: 45  )
f2 = Flat.create!(owner: u2, name: "Appart jolie joli", capacity: 1, city: "Lille", street: "rue nationnal", zip_code:"59000", description: "Appart bien pourri pour étudient", price: 20  )
f3 = Flat.create!(owner: u3, name: "Maison individuelle", capacity: 6, city: "Lille", street: "rue jean sans peur", zip_code:"59000", description: "ideal famille a la rue", price: 80  )
f4 = Flat.create!(owner: u4, name: "Chambre chez particuler", capacity: 2, city: "Hem", street: "rue general", zip_code:"59510", description: "Chambre chez particulier avec acces autonome ", price: 50  )
f5 = Flat.create!(owner: u5, name: "Ferme rénové", capacity: 10, city: "Baisieux", street: "Rue d'escamin", zip_code:"59780", description: "Superbe ferme en pleine campagne", price: 110  )
f6 = Flat.create!(owner: u5, name: "Magnifique pension", capacity: 15, city: "Lille", street: "Rue lesquin", zip_code:"59000", description: "Magnifique pension !", price: 150  )

Booking.create!(check_in: "2015-10-21", check_out: "2015-10-25", guest: u2, flat: f1, status: "Waiting")
