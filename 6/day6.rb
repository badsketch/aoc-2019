file = File.open("input.txt")
orbit_data = file.readlines.map(&:chomp)

def calc_orbit_count(orb_map, orbit, orbit_data)
    orbit_objects = orbit.split(')')
    source = orbit_objects[0]
    orbiter = orbit_objects[1]
    if source == 'COM'
        return 1
    elsif orb_map.key(source)
        orbits = 1 + orb_map[source]
        orb_map[orbiter] = orbits
        return orbits
    else
        orbits = 1 + calc_orbit_count(orb_map, find_direct_orbit(source, orbit_data), orbit_data)
        orb_map[orbiter] = orbits
        return orbits
    end
end

def find_direct_orbit(obj, orbit_data)
    orbit = orbit_data.find {|line| line.split(')')[1].eql? obj}
    return orbit
end

def calc_total_orbit_count(orbit_data)
    orb_map = {}
    return orbit_data.reduce(0) {|sum, orbit| sum + calc_orbit_count(orb_map,orbit,orbit_data)}
end

puts calc_total_orbit_count(orbit_data)



