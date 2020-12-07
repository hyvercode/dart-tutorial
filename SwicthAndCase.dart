void main() {
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      execute('CLOSED');
      break;
    case 'OPEN':
      execute('OPEN');
      break;
    default:
      execute('FAILED');
  }
}

void execute(String command) {
  print(command);
}
