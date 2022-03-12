#define	PS_SELECT		0	// data[0] byte
#define	PS_L3			1
#define	PS_R3			2
#define	PS_START		3
#define	PS_UP			4
#define	PS_RIGHT		5
#define	PS_DOWN			6
#define	PS_LEFT			7

#define	PS_L2			0	// data[1] byte
#define	PS_R2			1
#define	PS_L1			2
#define	PS_R1			3
#define	PS_TRIANGLE		4
#define	PS_CIRCLE		5
#define	PS_CROSS		6
#define	PS_SQUARE		7

/* Hardware SPI defines AVR-Ps2 */
#define MOSI			PB5	    // SPI MOSI; receives commands from Ps2
#define MISO			PB6	    // SPI MISO; sends outgoing data to Ps2
#define SCK			    PB7	    // SPI SCK; serial clock controlled by Ps2, data is read on rising edge
#define ACK			    PB3	    // ACKNOWLEDGE, brief low pulse after each byte transfer in packet, except after final byte
#define SS			    PB4	    // SPI slave select pin
#define SPI_PORT		PORTB
#define SPI_PIN			PINB
#define SPI_DDR			DDRB
#define ENABLE_SPI      SPCR |= _BV(SPE)
#define DISABLE_SPI     SPCR &= ~_BV(SPE)

/* command status register defines */
// command status register 0 "CSR0"
#define LOCK_BIT		        0
#define ANALOG_MODE_BIT		    1
#define CONFIG_MODE_BIT		    2
#define COMM_OK_BIT		        3
#define FIRST_MOTOR_BYTE_SMALL	4
#define FIRST_MOTOR_BYTE_LARGE	5
#define SECOND_MOTOR_BYTE_SMALL	6
#define SECOND_MOTOR_BYTE_LARGE	7
#define COMM_OK_CHECK           CSR0 & _BV(COMM_OK_BIT)
#define COMM_IS_OK              CSR0 |= _BV(COMM_OK_BIT)
#define COMM_IS_NOT_OK          CSR0 &= ~_BV(COMM_OK_BIT)
