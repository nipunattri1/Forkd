/// Which slice of the user's projects the Projects screen shows.
enum ProjectTab {
  starred('Starred'),
  yours('Yours'),
  explore('Explore');

  const ProjectTab(this.label);

  final String label;
}
