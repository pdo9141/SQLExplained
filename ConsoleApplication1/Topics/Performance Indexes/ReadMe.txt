01) See Tuning Advisor folder
02) An important indicator is logical reads, try to get that down with proper indexes
03) Use covering indexes (include keyword) to help with key lookups in execution plan
04) Don't go too wild, if your app is write heavy then minimize your indexes