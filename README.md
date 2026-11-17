# Tower of Hanoi Visualizer

A visual implementation of the **Tower of Hanoi puzzle** using HTML, CSS, JavaScript, and SWI-Prolog.

## Project Description

This project demonstrates how the Tower of Hanoi puzzle works by visually displaying the movement of disks between three towers. The Prolog backend generates the solution, while the frontend displays and animates the moves.

## Technologies Used

- HTML
- CSS
- JavaScript
- SWI-Prolog

## Project Files

| File | Description |
|---|---|
| `index.html` | Main visual interface |
| `hanoi.pl` | Prolog backend and puzzle solver |
| `README.md` | Project documentation |

## Requirements

- Windows, macOS, or Linux
- [SWI-Prolog](https://www.swi-prolog.org/Download.html)
- A modern web browser

## How to Run the Project

1. Install SWI-Prolog.
2. Download or clone this repository.
3. Open Command Prompt or a terminal inside the project folder.
4. Run the following command:

```bash
swipl -q -s hanoi.pl
```

5. Keep the terminal open while the server is running.
6. Open your browser and visit:

```text
http://localhost:8000
```

7. Use the visualizer to explore the Tower of Hanoi solution.

### Windows Alternative

If Windows says `swipl` is not recognized, try:

```cmd
"C:\Program Files\swipl\bin\swipl.exe" -q -s hanoi.pl
```

## How to Stop the Server

Press `Ctrl + C` in the terminal.

## Author

Project created as an educational demonstration of the Tower of Hanoi puzzle using Prolog and web technologies.
