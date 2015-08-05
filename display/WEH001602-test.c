#include <stdint.h>
#include "WEH001602-lib.h"


main()
 {
   
   my_spi_WEH001602_init();
   my_spi_WEH001602_scroll_text("Three missing UK teenagers believed to be heading to join Islamic State militants are thought to have crossed into Syria, police say.", TOP_ROW, 5);

 }
