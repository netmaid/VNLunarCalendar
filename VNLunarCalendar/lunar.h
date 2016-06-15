//
//  lunar.h
//  VNLunarCalendar
//
//  Created by ened on 2016. 6. 14..
//  Copyright © 2016년 netmaid. All rights reserved.
//

#ifndef vn_lunar_h
#define vn_lunar_h


typedef struct _vndate_t {
	uint year;
	uint month;
	uint day;
	bool leap;
} vndate_t;


#ifdef __cplusplus
extern "C" {
#endif

	
	void vn_date(vndate_t* d);
	int vn_sol2lun(vndate_t* to, const vndate_t* from);
	int vn_lun2sol(vndate_t* to, const vndate_t* from);
	

#ifdef __cplusplus
}
#endif


#endif /* vn_lunar_h */
