show_types = {
  '1' => 'Acoustic Duo',
  '2' => 'Acoustic Trio',
  '3' => 'Full Band',
  '4' => 'Acoustic Solo'
}

venues = JSON.parse(File.read("#{Rails.root}/scripts/venues.json"))
bands = JSON.parse(File.read("#{Rails.root}/scripts/bands.json"))
shows = JSON.parse(File.read("#{Rails.root}/scripts/shows.json"))

shows.each do |show|
  venue_nid = show['field_venue']['und'][0]['nid'];
  venue = venues.find { |node| node['nid'] == venue_nid }

  band_nid = show['field_band']['und'][0]['nid'];
  band = bands.find { |node| node['nid'] == band_nid }

  show_type_tid = show['field_show_type']['und'][0]['tid']

  venue_name = venue['title']
  band_name = band['title']
  band_type = show_types[show_type_tid]
  date = show['field_date']['und'][0]['value']
  military_time = show['field_time']['und'][0]['value']
  time = Time.strptime(military_time.sub(':', ''), '%H%M').strftime('%l:%M%P').strip
  description = show['field_description'].present? ? show['field_description']['und'][0]['value'] : ''

  Show.create!(
    band_name: band_name,
    band_type: band_type,
    venue_name: venue_name,
    date: date,
    time: time,
    description: description
  )
end
