path = "<enter the path here>"
file1 = "EBeam_example1.gds" #name of 1st file
file2 = "EBeam_example2.gds" #name of the second file
 out = "MergedFile.gds" #name of the output file
 
 ly1 = RBA::Layout::new
 ly1.read(path+file1)
 
 ly2 = RBA::Layout::new
 ly2.read(path+file2)
 
 ly1_top_cell = ly1.top_cell
 new_cell = ly1.create_cell(ly2.top_cell.name)
 new_cell.copy_tree(ly2.top_cell)
 angle = 0
 mirror = false
 x= 1000*1000
 y = 1000*1000
 trans = RBA::Trans::new(angle,mirror,x,y)
 ly1_top_cell.insert(RBA::CellInstArray::new(new_cell.cell_index,trans))
 ly1.write(path+out)
