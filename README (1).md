
# 🅿️ Car Parking Timer System (x86 Assembly - EMU8086)

This project implements a basic **car parking timer system** using x86 Assembly (EMU8086). It allows users to enter the amount of money they pay, and based on the amount, the system provides access to the parking lot for a specific duration. Once time expires, the system notifies the user.

## 💡 Features
- Accepts user input for payment (in Egyptian pounds).
- Valid options:  
  - **5 EGP** → 5 minutes  
  - **10 EGP** → 30 minutes  
  - **20 EGP** → 60 minutes  
- Custom timer simulation using delay loops (not real-time accurate).
- Handles invalid entries and allows users to exit by entering `0`.
- Displays appropriate messages for expired time or wrong entries.

## 🛠 Technologies Used
- x86 Assembly (EMU8086 / TASM syntax)
- MS-DOS Interrupts (INT 21h for I/O)
- Delay simulation using loop-based timing (non-hardware based)

## 🔄 How It Works
1. User is prompted to input the paid amount.
2. The system parses the numeric input and calculates the corresponding parking time.
3. A loop simulates the countdown.
4. After the delay, a message "Expired..." is displayed.
5. Invalid inputs show an error message, and the program repeats until `0` is entered.

## 🧪 Emulator
This program was developed and tested using the **EMU8086** emulator.

## ⚠️ Note
This project is for educational purposes and simulates delay using CPU loops. Timing is approximate and not suited for real-time applications.
