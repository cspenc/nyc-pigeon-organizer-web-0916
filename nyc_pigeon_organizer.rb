require 'pry'
#
# #########
#THIS WORKS BUT SANDWICH
# #########
# def nyc_pigeon_organizer(data)
#   pigeon_list = {}
#   data.each do |info, descriptor_hash|
#     descriptor_hash.each do |descriptors, names|
#       names.each do |name|
#         if pigeon_list.key?(name)
#           if pigeon_list[name].key?(info)
#             pigeon_list[name][info] << descriptors.to_s
#           else
#             pigeon_list[name][info] = [descriptors.to_s]
#           end
#         else
#           pigeon_list[name] = {info => [descriptors.to_s]}
#         end
#       end
#     end
#   end
#   return pigeon_list
# end

#########

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

##########
# FIXING THE PIGEON
##########

def nyc_pigeon_organizer(pigeon_data)
  hold_arr = []
  new_hash = {}
  pigeon_data.each_key { |key| hold_arr << pigeon_data[key].values }
  hold_arr.flatten(3).uniq.each do |pigeon_names|
    new_hash[pigeon_names] = {
      :color => [],
      :gender => [],
      :lives => []
    }
  end
  new_hash.each_pair do |name, attribute|
    attribute.each_pair do |attri, attriArray|
      pigeon_data.each do |top_lvl, next_lvl|
        next_lvl.each do |sec_lvl, names|
          if pigeon_data[top_lvl][sec_lvl].include?(name) && attri == top_lvl
            attriArray << sec_lvl.to_s
          end
        end
      end
    end
  end
end
