# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.where(email: "bob@bob.bob", name: "bob boberson").first_or_create(password: "password", password_confirmation: "password")



f1 = Flower.where(name: "Lilly", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ullamcorper odio at eros viverra, nec dignissim lectus dignissim. Sed fermentum facilisis vestibulum. Aliquam erat volutpat. Nunc mollis fermentum turpis eget viverra. Nunc finibus ullamcorper justo eu varius. Aliquam quis justo eget mauris tincidunt interdum. Proin maximus viverra ante, eu fermentum tellus placerat eu. Praesent vestibulum, purus at consequat varius, tellus risus vulputate eros, egestas dapibus enim mi hendrerit sem. Aenean lorem mauris, molestie sed varius et, convallis id lacus. Suspendisse eleifend justo odio. Nam consequat dolor nunc, quis blandit sem bibendum eu. Sed in iaculis orci.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/lilly.jpg") do |f|
  f1.image = f
  f1.save
end

f2 = Flower.where(name: "Rose", description: "Duis eu gravida libero. Cras eget iaculis ligula. Sed hendrerit pharetra ex, non convallis lorem accumsan ut. Mauris tempor euismod dictum. Sed ac consectetur turpis, a semper elit. Donec at massa accumsan, euismod tortor eu, gravida eros. Donec a purus eget nibh tincidunt euismod. Aliquam erat volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In sem nibh, elementum sit amet velit id, viverra consectetur massa. Donec auctor ornare lobortis. In feugiat molestie neque, ut laoreet massa ornare quis. In semper quam eu ultricies rutrum. Curabitur ut hendrerit nulla. Fusce libero odio, faucibus vitae finibus in, ornare in ipsum. Sed auctor vulputate finibus.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/rose.jpg") do |f|
  f2.image = f
  f2.save
end

f3 = Flower.where(name: "Tulip", description: "Duis non tristique tellus, nec aliquet nisi. Etiam lorem erat, tempus sed mattis id, iaculis a arcu. Suspendisse felis metus, feugiat eu metus quis, vestibulum pulvinar massa. Praesent consectetur fringilla ipsum, at consectetur ex feugiat sit amet. Suspendisse fringilla ligula et arcu finibus pellentesque. Mauris et odio vitae justo lobortis pulvinar. Morbi ipsum tellus, pellentesque eu est non, elementum porttitor felis. Phasellus consequat erat sit amet vulputate tristique. Mauris id fermentum ipsum. Suspendisse congue ultricies felis, non semper tellus blandit id. Pellentesque eget porttitor ligula, in accumsan massa. Pellentesque vel ornare magna.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/tulip.jpg") do |f|
  f3.image = f
  f3.save
end

f = Flower.where(name: "Forget Me Not", description: "Praesent pulvinar vestibulum bibendum. Praesent porttitor pulvinar rutrum. Curabitur luctus elementum vulputate. Pellentesque aliquam mi non fermentum mollis. Praesent a efficitur tellus. Praesent venenatis nisl id rutrum rutrum. Sed sed felis eu elit pellentesque gravida. Nullam ultricies orci id neque faucibus volutpat. Nam ac diam eu velit sodales suscipit. Etiam tincidunt magna urna. Nam sagittis, magna ac placerat lacinia, turpis est pharetra turpis, quis mattis justo sapien ac lectus. Vivamus non maximus dolor.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/forget-me-not.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Gardenia", description: "Curabitur ullamcorper dui quis sapien ultricies, ac pellentesque purus condimentum. Mauris sed ipsum lectus. Vestibulum lacinia, sem ut elementum venenatis, ipsum libero eleifend quam, vel accumsan sapien leo eget lectus. Phasellus vitae venenatis leo, molestie egestas nisi. Praesent mollis arcu quam, sed efficitur ante maximus eu. Duis ut neque sed dolor ornare iaculis sed ut ante. Fusce tempus nulla tortor, sit amet eleifend libero malesuada ut. Phasellus sodales ornare lectus, non tristique neque ultrices a. Nam sit amet lorem tincidunt, eleifend justo sit amet, lacinia tortor.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/gardenia.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Oleander", description: "Aenean eu sem nec orci tristique rutrum ac vel quam. Proin faucibus libero sit amet viverra rhoncus. Curabitur euismod tellus ut mauris blandit, eget sodales neque porta. Etiam nunc ligula, rhoncus et purus id, mattis egestas enim. Etiam non viverra neque, eget dapibus lacus. Donec pulvinar ante at laoreet interdum. Nunc vestibulum lorem eget hendrerit feugiat. Mauris varius orci sed mi placerat, vitae blandit risus consectetur. Curabitur dictum velit velit, a iaculis velit ullamcorper sit amet. Nulla hendrerit eget risus a malesuada. Quisque mi quam, viverra a semper ut, posuere ac ligula.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/oleander.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Pansy", description: "Proin in interdum urna, et consequat elit. In blandit non mauris tristique tempor. Quisque vitae nibh eu nulla semper volutpat. Aenean eu ultrices ex, non ornare enim. Aenean viverra nibh ligula, quis luctus justo congue ultrices. Nulla rhoncus efficitur iaculis. Vivamus porta nisi mi, sed venenatis elit lacinia at. Maecenas laoreet interdum dolor, id elementum nisi accumsan malesuada. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus id maximus dolor. Pellentesque aliquet tellus magna, facilisis tincidunt diam gravida lobortis.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/pansy.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Bougainvillea", description: "Cras luctus imperdiet risus, quis fringilla velit luctus at. Aenean id pellentesque mauris. Donec eget lacus neque. Duis sed dignissim lacus. Sed ut dolor ac augue laoreet vestibulum. Aenean id mi nec purus semper porta in eu eros. Mauris feugiat suscipit dui, sit amet faucibus ante placerat sed. Quisque ut ornare est. Morbi interdum quam turpis, sit amet feugiat magna finibus non. Nam interdum magna elementum turpis maximus fermentum.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/bougainvillea.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Daisy", description: "Quisque quis elit eleifend, efficitur dui eget, dignissim lectus. Aenean non faucibus diam. Nam commodo, libero vel mollis interdum, neque nunc maximus lacus, non porttitor erat lacus ac nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam suscipit magna laoreet, mollis eros nec, sodales justo. Vivamus commodo erat vestibulum sodales ultricies. Proin sit amet mi consequat, fermentum dui sed, placerat leo. Aliquam placerat tempus porttitor. Mauris pretium ullamcorper massa sed pellentesque. Mauris turpis metus, gravida ac nisi sit amet, tempus pellentesque libero. Duis ac orci vitae purus semper gravida. Duis tristique non est ut condimentum. Vestibulum lobortis nunc mi, sed aliquam dui eleifend eu. Vivamus vulputate diam quis gravida fermentum. Pellentesque feugiat eros at augue tincidunt finibus. Morbi rhoncus sem non felis iaculis maximus.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/daisy.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Jasmine", description: "Nulla ipsum urna, mattis eget justo ut, dapibus tincidunt nulla. Suspendisse commodo vestibulum sagittis. Etiam in sapien arcu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc tincidunt vel arcu ut maximus. Donec posuere velit in sapien feugiat, in ultricies justo hendrerit. Proin euismod libero nec urna fermentum, eu porta dolor lacinia. Pellentesque vitae tortor quis sem venenatis malesuada.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/jasmine.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Peony", description: "Mauris vel tincidunt tortor. Suspendisse turpis sem, consequat quis elit eget, aliquam tempor felis. Fusce id mattis nunc. Praesent vel porta neque. Nulla a risus et elit ornare tincidunt eu et tellus. Fusce nec porttitor orci. Vivamus fringilla sapien at mauris tempus imperdiet. Cras ac diam leo. Donec interdum lectus at ligula porta efficitur. Ut a tristique sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/peony.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Primula", description: "Phasellus posuere eget tellus eu iaculis. Mauris nec sapien vehicula, placerat nunc at, tempor est. Vivamus in mauris gravida, pharetra metus vel, gravida nunc. Maecenas viverra in turpis rhoncus tincidunt. Nunc porttitor ut lectus sed suscipit. Aliquam erat volutpat. Suspendisse porttitor turpis vel mi malesuada, sodales egestas erat convallis. Morbi cursus gravida aliquet. Fusce sagittis nisi sed fringilla tincidunt. Donec non nisi nisi. Phasellus nulla orci, egestas non vulputate at, fermentum eget libero. Quisque sed elit aliquam, lacinia justo a, vulputate sapien. Curabitur varius vulputate nisl at condimentum. Cras volutpat ullamcorper diam, nec posuere odio lobortis eu. Suspendisse dapibus diam sit amet vulputate aliquet. Vivamus at fringilla neque.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/primula.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Chrysanthemum", description: "Praesent tempus condimentum sem quis rutrum. Nulla fringilla neque ut ultrices euismod. Sed nec est sed velit lobortis suscipit at at mi. Praesent vel imperdiet sapien. Donec accumsan posuere tincidunt. Vestibulum venenatis laoreet elit in ornare. Vestibulum non lorem dui. In eget libero molestie, auctor diam at, ornare sem. Aenean eu mollis nunc. Nam in aliquet nunc. Vivamus mollis mattis arcu commodo commodo.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/chrysanthemum.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Hyacinth", description: "Praesent porta ipsum ligula, at varius nibh rutrum vel. Sed ac sodales lectus. Donec ultrices turpis leo, et hendrerit ipsum tincidunt eget. Fusce fringilla vulputate mauris id pharetra. Integer vitae elit sit amet dolor aliquam placerat. Quisque venenatis venenatis iaculis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce commodo tempor mi, in sagittis augue vestibulum vel. Vivamus viverra congue mauris, eget tincidunt neque. Praesent consectetur consequat felis, sed interdum dolor laoreet nec. Donec ut risus tincidunt, eleifend mauris et, accumsan lectus. Nam tincidunt orci vitae finibus consequat. Nullam molestie magna id ultrices porta. Proin tincidunt nunc vel mauris semper congue. Donec a dictum ipsum.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/hyacinth.jpg") do |fi|
  f.image = fi
  f.save
end

f = Flower.where(name: "Hydrangea", description: "Proin pulvinar, dui fermentum commodo venenatis, nisl neque convallis tellus, et sollicitudin justo justo in eros. Praesent vel magna at leo convallis egestas. Fusce tempor venenatis arcu, sit amet feugiat tortor pellentesque luctus. Cras quis eros eget magna dictum rutrum quis eu dolor. Integer pretium porttitor dui, eu posuere ex ullamcorper nec. Mauris laoreet sollicitudin hendrerit. Aenean eleifend dui ac nulla ultrices, sed aliquam ipsum gravida. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec orci eros, egestas semper euismod vitae, rhoncus ac dui. Fusce sed metus felis. Integer volutpat dignissim blandit. Mauris ultricies sit amet tortor nec finibus. Fusce euismod bibendum turpis, et vestibulum ex dictum non. Sed sem velit, sollicitudin sit amet neque id, dignissim egestas ipsum. Nam mollis dignissim elit, quis volutpat risus sodales ut. Ut tellus velit, euismod a tempus quis, porta vitae urna.", price: ((rand * 10) +1).round(2)).first_or_create(stock: 100)
File.open("app/assets/images/hydrangea.jpg") do |fi|
  f.image = fi
  f.save
end

o = Order.where(user: u, status: "in_progress").first_or_create()

OrdersFlower.where(order: o, flower: f1, quantity: 3).first_or_create()
OrdersFlower.where(order: o, flower: f2, quantity: 12).first_or_create()
OrdersFlower.where(order: o, flower: f3, quantity: 7).first_or_create()
