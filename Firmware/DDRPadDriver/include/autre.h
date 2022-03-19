
/* other macros */
// macro for PS-AVR SPI communication
//#define PS_AVR_COMM(avrdata, pscommand) {\
//	if(COMM_OK_CHECK){\
//		START_TIMER_AT(200);\
//		sent_seq[sample_num] = avrdata;\
//		SPDR = avrdata;\
//		while((!(SPSR & _BV(SPIF))) && (!(TIFR2 & _BV(TOV2))));\
//		(TIFR2 & _BV(TOV2)) ? (COMM_IS_NOT_OK) : (pscommand = SPDR);\
//		sampled_seq[sample_num++] = pscommand; \
//		SPI_PORT &= ~_BV(MISO);\
//		}\
//	}
#define PS_AVR_COMM(avrdata, pscommand) {\
	sent_seq[sample_num] = avrdata;\
	current_seq_num++;\
	seq_num[sample_num] = current_seq_num;\
	SPDR = avrdata;\
	loop_until_bit_is_set(SPSR, SPIF);\
	pscommand = SPDR;\
	sampled_seq[sample_num++] = pscommand; \
}

// SPI acknowledge macro, sends a 2us low ACK pulse following every SPI byte received, not sent following final byte in packet
//#define ACKNOWLEDGE {\
//	_delay_us(4);\
//	SPI_PORT &= ~_BV(ACK);\
//	_delay_us(3);\
//	SPI_PORT |= _BV(ACK);\
//}
//#define ACKNOWLEDGE {\
//		_delay_us(4);\
//		if(COMM_OK_CHECK){\
//		SPI_DDR |= _BV(ACK);\
//		SPI_PORT |= _BV(ACK);\
//		_delay_us(3);\
//		SPI_DDR &= ~_BV(ACK);\
//		SPI_PORT &= ~_BV(ACK);\
//	}\
//}
#define ACKNOWLEDGE { ack(); }

// write 1 to TOV2 bit of TIFR2 to clear flag; counter starts at value "x", counts up to 255 then overflows and sets TOV2
#define START_TIMER_AT(x) {\
	TIFR2 |= _BV(TOV2);\
	TCNT2 = x;\
}
