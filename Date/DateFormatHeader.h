//
//  DateFormatHeader.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#ifndef DateFormatHeader_h
#define DateFormatHeader_h

typedef enum : NSUInteger {
    /// 年:月:日 时:分:秒
    DateFormatter_YMDHMS,
    /// 年:月:日 时:分
    DateFormatter_YMDHM,
    /// 年:月:日 时
    DateFormatter_YMDH,
    /// 年:月:日
    DateFormatter_YMD,
    /// 年/月/日 时:分:秒
    DateFormatter_YMDHMS1,
    /// 年/月/日 时:分
    DateFormatter_YMDHM1,
    /// 年/月/日 时
    DateFormatter_YMDH1,
    /// 年/月/日
    DateFormatter_YMD1,
    /// 年-月-日 时:分:秒
    DateFormatter_YMDHMS2,
    /// 年-月-日 时:分
    DateFormatter_YMDHM2,
    /// 年-月-日 时
    DateFormatter_YMDH2,
    /// 年-月-日
    DateFormatter_YMD2,
} DateFormatter;

#endif /* DateFormatHeader_h */
