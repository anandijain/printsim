import pymesh
mesh = pymesh.load_mesh("fun-Body.stl")
convex_hull = pymesh.compute_convex_hull(mesh)
pymesh.save_mesh("convex_hull.stl", convex_hull)
