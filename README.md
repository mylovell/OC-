# 多继承
通过遵守多个协议来达到多继承的目的

【更优】Children : NSProxy<ManProtocol,WomenProtocol>   在.m文件中`不会`提示要实现协议中的方法

【次之】Children : NSObject<ManProtocol,WomenProtocol>   在.m文件中`会`提示要实现协议中的方法