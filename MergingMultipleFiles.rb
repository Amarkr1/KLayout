
# Enter your Ruby code here


file1 = "path to file"
file2 = "path to file"
file3 = "path to file"
file4 = "path to file"
out = "path to file"
puts "Reading #{file1} .."
ly1 = RBA::Layout::new
ly1.read(file1)

puts "Reading #{file2} .."
ly2 = RBA::Layout::new
ly2.read(file2)

puts "Reading #{file3} .."
ly3 = RBA::Layout::new
ly3.read(file3)

puts "Reading #{file4} .."
ly4 = RBA::Layout::new
ly4.read(file4)


ly1_top_cell = ly1.top_cell


new_cell = ly1.create_cell(ly2.top_cell.name)


new_cell.copy_tree(ly2.top_cell)

angle = 0  # (1 = 90, 2 = 180, 3 = 270 degree)
mirror = false
x = 116*1000
y = 11726*1000
trans = RBA::Trans::new(angle, mirror, x, y);
ly1_top_cell.insert(RBA::CellInstArray::new(new_cell.cell_index, trans))

#---------------------------------------------------------------------------

new_cell = ly1.create_cell(ly3.top_cell.name)
new_cell.copy_tree(ly3.top_cell)

angle = 0  # (1 = 90, 2 = 180, 3 = 270 degree)
mirror = false
x = 116*1000
y = 3566*1000
trans = RBA::Trans::new(angle, mirror, x, y);
ly1_top_cell.insert(RBA::CellInstArray::new(new_cell.cell_index, trans))

#---------------------------------------------------------------------------

new_cell = ly1.create_cell(ly4.top_cell.name)

new_cell.copy_tree(ly4.top_cell)

angle = 0  # (1 = 90, 2 = 180, 3 = 270 degree)
mirror = false
x = 116*1000
y = 9926*1000
trans = RBA::Trans::new(angle, mirror, x, y);
ly1_top_cell.insert(RBA::CellInstArray::new(new_cell.cell_index, trans))
# saving the result
puts "Writing #{out} .."
ly1.write(out)