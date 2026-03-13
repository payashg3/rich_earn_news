#include "pch-cpp.hpp"





template <typename T1, typename T2, typename T3>
struct VirtualActionInvoker3
{
	typedef void (*Action)(void*, T1, T2, T3, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeObject* obj, T1 p1, T2 p2, T3 p3)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_virtual_invoke_data(slot, obj);
		((Action)invokeData.methodPtr)(obj, p1, p2, p3, invokeData.method);
	}
};
template <typename R, typename T1, typename T2>
struct VirtualFuncInvoker2
{
	typedef R (*Func)(void*, T1, T2, const RuntimeMethod*);

	static inline R Invoke (Il2CppMethodSlot slot, RuntimeObject* obj, T1 p1, T2 p2)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_virtual_invoke_data(slot, obj);
		return ((Func)invokeData.methodPtr)(obj, p1, p2, invokeData.method);
	}
};

struct Dictionary_2_t14FE4A752A83D53771C584E4C8D14E01F2AFD7BA;
struct Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8;
struct IDictionary_2_t6E45F1BFCF8907736E4E289E478607C9D311F2AA;
struct IDictionary_2_t035224085B86686A781D8AB3019CE2C9FD838FA6;
struct IEqualityComparer_1_tAE94C8F24AD5B94D4EE85CA9FC59E3409D41CAF7;
struct KeyCollection_t1420BAEB43E57D4307CD761B733F12BFA4308419;
struct ListenerRegistrationMap_1_t86C1C4A777AF595737DD7CE070E15B23120B62EF;
struct ValueCollection_t315C61B5770B270D960053646FE43503E622C8C2;
struct EntryU5BU5D_t59D59A96DC34F038BF97F6CCBF64B076DE13E022;
struct ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031;
struct Int32U5BU5D_t19C97395396A72ECAF310612F0760F165060314C;
struct TypeU5BU5D_t97234E1129B564EB38B8D85CAC2AD8B5B9522FFB;
struct Binder_t91BFCE95A7057FADF4D8A1A342AFE52872246235;
struct BlobConverter_t7A6588D9EF3D39EEC09A6193CDF832D15A2EBC6D;
struct BooleanConverter_t413CD06B6AFB2069B97F4F69B4D5B54A7103F43E;
struct ByteArrayConverter_tFC576D6F861A6A5D054DD2D1C14D90FD491309ED;
struct ByteConverter_tA676FFBC239BA57CE9A77C4CAE57A5ACA66679FC;
struct ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986;
struct DateTimeConverter_t414F0BA1D7E783E6AA182523D5A665E835379C4F;
struct DateTimeOffsetConverter_tAD4C59B3E28745F5A1E340FFE014D257CD29887F;
struct DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E;
struct DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF;
struct DocumentReferenceConverter_t77C4B95A6C934F7341FA4093848C74595B1926E5;
struct DocumentReferenceProxy_t2130D62C085B6D0F09E46550D38F9BD1EEBE0F7A;
struct DocumentSnapshot_tB7A99E6315793884C5227C22A024FF1E9444CC2F;
struct DoubleConverter_t6E78FF273149A7409508A304891B4322DDF611B4;
struct FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26;
struct FieldValueProxyConverter_t8075153C7E9CB3F49FE2D8F52755947F9751897F;
struct FirebaseFirestore_tAF16CB8787D9068C20C4BDC6D61F35AD0AF723A8;
struct GeoPointConverter_tC63DED3B80C043912E1370DE8FA78D76902967FF;
struct GeoPointProxy_t01FBB939675E91CACA5D94712514DA430CD46968;
struct Int16Converter_t7164A70E8D6EE2EA90E75205A9D842833F195E3B;
struct Int32Converter_t57F1559BACE26877F76CE073B9A5614C37377587;
struct Int64Converter_t68449D8D48F5695BD5DBB8BFD31257B5C8B20953;
struct IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749;
struct MapConverterBase_tB74722C6C09BD0135DB6428DBDCA720402A459E3;
struct MemberFilter_tF644F1AE82F611B677CE1964D5A3277DDA21D553;
struct SByteConverter_t878367D86AB2143AC558AB69487A33F5FC3D7FD0;
struct SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D;
struct SingleConverter_t5DB6880D844DEC4685528999AAF0F251516DE639;
struct String_t;
struct StringConverter_tE3ACF1666C7A43A5ED0ED035D3A21A4527EFF33A;
struct TimestampConverter_t334CE72D4B7105AA99405E53ADC81B5C4C246D1E;
struct TimestampProxy_t62B4D8B5017180CFD050625E52B3F07CB596BFC3;
struct Type_t;
struct UInt16Converter_tDC237C86A6C6C07A47254910EACA583EF49DCF97;
struct UInt32Converter_t37920E7844B75328507C6A82EB007A86F1892151;
struct UInt64Converter_tA7BED8E18DDF9AFC86E767A972832A7A820A566C;
struct Void_t4861ACF8F4594C3437BB48B6E56783494B843915;
struct ListenerDelegate_tAE1235754123BEFDBA5A5392D62D732DEF5B32C6;

IL2CPP_EXTERN_C RuntimeClass* Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C const RuntimeMethod* ByteConverter_DeserializeInteger_m75366C8C52D7A8E3C45B7AD38DBAE758E8C0BA9A_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* Dictionary_2__ctor_mEFBE7A31B17F88B49904A09737C23C6D9489E210_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* Int16Converter_DeserializeInteger_mB51802CC353F9A8092891D6FC0FE1DE6BAD31A84_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* Int32Converter_DeserializeInteger_m0CBD454EA743313EF45C767D24B33D90CA1837D9_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* IntegerConverterBase_DeserializeDouble_mCD20BDEFC96DA44E122A69BF03A993BCA048B752_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* SByteConverter_DeserializeInteger_m756B896D761C10275AE95BB4446D5872C5FD1AD7_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* UInt16Converter_DeserializeInteger_mBB92F046B498A47235E6D5C61E1D4DF5D139D71A_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* UInt32Converter_DeserializeInteger_m26885822BC645607B2FB01500B8173B823A3441A_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* UInt64Converter_DeserializeInteger_mC2073BA9F288A43CB50EDC0AF8D596DFD933F893_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeType* Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0_0_0_0_var;
IL2CPP_EXTERN_C const RuntimeType* Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_0_0_0_var;

struct ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031;

IL2CPP_EXTERN_C_BEGIN
IL2CPP_EXTERN_C_END

#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
struct Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8  : public RuntimeObject
{
	Int32U5BU5D_t19C97395396A72ECAF310612F0760F165060314C* ____buckets;
	EntryU5BU5D_t59D59A96DC34F038BF97F6CCBF64B076DE13E022* ____entries;
	int32_t ____count;
	int32_t ____freeList;
	int32_t ____freeCount;
	int32_t ____version;
	RuntimeObject* ____comparer;
	KeyCollection_t1420BAEB43E57D4307CD761B733F12BFA4308419* ____keys;
	ValueCollection_t315C61B5770B270D960053646FE43503E622C8C2* ____values;
	RuntimeObject* ____syncRoot;
};
struct U3CPrivateImplementationDetailsU3E_tA33FA5CFD632B6289519017AA4220B8103FBB8CF  : public RuntimeObject
{
};
struct ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986  : public RuntimeObject
{
	Type_t* ___TargetType;
};
struct DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E  : public RuntimeObject
{
	DocumentSnapshot_tB7A99E6315793884C5227C22A024FF1E9444CC2F* ___Snapshot;
};
struct DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF  : public RuntimeObject
{
	DocumentReferenceProxy_t2130D62C085B6D0F09E46550D38F9BD1EEBE0F7A* ____proxy;
	FirebaseFirestore_tAF16CB8787D9068C20C4BDC6D61F35AD0AF723A8* ____firestore;
};
struct MemberInfo_t  : public RuntimeObject
{
};
struct SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D  : public RuntimeObject
{
	RuntimeObject* ____customConverters;
};
struct String_t  : public RuntimeObject
{
	int32_t ____stringLength;
	Il2CppChar ____firstChar;
};
struct ValueType_t6D9B272BD21782F0A9A14F2E41F85A50E97A986F  : public RuntimeObject
{
};
struct ValueType_t6D9B272BD21782F0A9A14F2E41F85A50E97A986F_marshaled_pinvoke
{
};
struct ValueType_t6D9B272BD21782F0A9A14F2E41F85A50E97A986F_marshaled_com
{
};
struct Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35 
{
	ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031* ____bytes;
	int32_t ____hash;
};
struct Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_marshaled_pinvoke
{
	Il2CppSafeArray* ____bytes;
	int32_t ____hash;
};
struct Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_marshaled_com
{
	Il2CppSafeArray* ____bytes;
	int32_t ____hash;
};
struct BlobConverter_t7A6588D9EF3D39EEC09A6193CDF832D15A2EBC6D  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22 
{
	bool ___m_value;
};
struct BooleanConverter_t413CD06B6AFB2069B97F4F69B4D5B54A7103F43E  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct Byte_t94D9231AC217BE4D2E004C4CD32DF6D099EA41A3 
{
	uint8_t ___m_value;
};
struct ByteArrayConverter_tFC576D6F861A6A5D054DD2D1C14D90FD491309ED  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D 
{
	uint64_t ____dateData;
};
struct DateTimeConverter_t414F0BA1D7E783E6AA182523D5A665E835379C4F  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct DateTimeOffsetConverter_tAD4C59B3E28745F5A1E340FFE014D257CD29887F  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct DocumentReferenceConverter_t77C4B95A6C934F7341FA4093848C74595B1926E5  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct Double_tE150EF3D1D43DEE85D533810AB4C742307EEDE5F 
{
	double ___m_value;
};
struct DoubleConverter_t6E78FF273149A7409508A304891B4322DDF611B4  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct FieldValueProxyConverter_t8075153C7E9CB3F49FE2D8F52755947F9751897F  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0 
{
	union
	{
		#pragma pack(push, tp, 1)
		struct
		{
			double ____latitude;
		};
		#pragma pack(pop, tp)
		struct
		{
			double ____latitude_forAlignmentOnly;
		};
		#pragma pack(push, tp, 1)
		struct
		{
			char ____longitude_OffsetPadding[8];
			double ____longitude;
		};
		#pragma pack(pop, tp)
		struct
		{
			char ____longitude_OffsetPadding_forAlignmentOnly[8];
			double ____longitude_forAlignmentOnly;
		};
	};
};
struct GeoPointConverter_tC63DED3B80C043912E1370DE8FA78D76902967FF  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct Int16_tB8EF286A9C33492FA6E6D6E67320BE93E794A175 
{
	int16_t ___m_value;
};
struct Int32_t680FF22E76F6EFAD4375103CBBFFA0421349384C 
{
	int32_t ___m_value;
};
struct Int64_t092CFB123BE63C28ACDAF65C68F21A526050DBA3 
{
	int64_t ___m_value;
};
struct IntPtr_t 
{
	void* ___m_value;
};
struct IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct MapConverterBase_tB74722C6C09BD0135DB6428DBDCA720402A459E3  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct SByte_tFEFFEF5D2FEBF5207950AE6FAC150FC53B668DB5 
{
	int8_t ___m_value;
};
struct Single_t4530F2FF86FCB0DC29F35385CA1BD21BE294761C 
{
	float ___m_value;
};
struct SingleConverter_t5DB6880D844DEC4685528999AAF0F251516DE639  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct StringConverter_tE3ACF1666C7A43A5ED0ED035D3A21A4527EFF33A  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 
{
	int64_t ____seconds;
	int32_t ____nanoseconds;
};
struct TimestampConverter_t334CE72D4B7105AA99405E53ADC81B5C4C246D1E  : public ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986
{
};
struct UInt16_tF4C148C876015C212FD72652D0B6ED8CC247A455 
{
	uint16_t ___m_value;
};
struct UInt32_t1833D51FFA667B18A5AA4B8D34DE284F8495D29B 
{
	uint32_t ___m_value;
};
struct UInt64_t8F12534CC8FC4B5860F2A2CD1EE79D322E7A41AF 
{
	uint64_t ___m_value;
};
struct Void_t4861ACF8F4594C3437BB48B6E56783494B843915 
{
	union
	{
		struct
		{
		};
		uint8_t Void_t4861ACF8F4594C3437BB48B6E56783494B843915__padding[1];
	};
};
#pragma pack(push, tp, 1)
struct __StaticArrayInitTypeSizeU3D10_t97EF624521201C9BBDCAFDE9C34BB090702C7D37 
{
	union
	{
		struct
		{
			union
			{
			};
		};
		uint8_t __StaticArrayInitTypeSizeU3D10_t97EF624521201C9BBDCAFDE9C34BB090702C7D37__padding[10];
	};
};
#pragma pack(pop, tp)
struct ByteConverter_tA676FFBC239BA57CE9A77C4CAE57A5ACA66679FC  : public IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749
{
};
struct DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4 
{
	DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D ____dateTime;
	int16_t ____offsetMinutes;
};
struct HandleRef_t4B05E32B68797F702257D4E838B85A976313F08F 
{
	RuntimeObject* ____wrapper;
	intptr_t ____handle;
};
struct Int16Converter_t7164A70E8D6EE2EA90E75205A9D842833F195E3B  : public IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749
{
};
struct Int32Converter_t57F1559BACE26877F76CE073B9A5614C37377587  : public IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749
{
};
struct Int64Converter_t68449D8D48F5695BD5DBB8BFD31257B5C8B20953  : public IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749
{
};
struct RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B 
{
	intptr_t ___value;
};
struct SByteConverter_t878367D86AB2143AC558AB69487A33F5FC3D7FD0  : public IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749
{
};
struct UInt16Converter_tDC237C86A6C6C07A47254910EACA583EF49DCF97  : public IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749
{
};
struct UInt32Converter_t37920E7844B75328507C6A82EB007A86F1892151  : public IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749
{
};
struct UInt64Converter_tA7BED8E18DDF9AFC86E767A972832A7A820A566C  : public IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749
{
};
struct DocumentReferenceProxy_t2130D62C085B6D0F09E46550D38F9BD1EEBE0F7A  : public RuntimeObject
{
	HandleRef_t4B05E32B68797F702257D4E838B85A976313F08F ___swigCPtr;
	bool ___swigCMemOwn;
};
struct FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26  : public RuntimeObject
{
	HandleRef_t4B05E32B68797F702257D4E838B85A976313F08F ___swigCPtr;
	bool ___swigCMemOwn;
};
struct GeoPointProxy_t01FBB939675E91CACA5D94712514DA430CD46968  : public RuntimeObject
{
	HandleRef_t4B05E32B68797F702257D4E838B85A976313F08F ___swigCPtr;
	bool ___swigCMemOwn;
};
struct TimestampProxy_t62B4D8B5017180CFD050625E52B3F07CB596BFC3  : public RuntimeObject
{
	HandleRef_t4B05E32B68797F702257D4E838B85A976313F08F ___swigCPtr;
	bool ___swigCMemOwn;
};
struct Type_t  : public MemberInfo_t
{
	RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B ____impl;
};
struct U3CPrivateImplementationDetailsU3E_tA33FA5CFD632B6289519017AA4220B8103FBB8CF_StaticFields
{
	__StaticArrayInitTypeSizeU3D10_t97EF624521201C9BBDCAFDE9C34BB090702C7D37 ___2A5E450F5962F3D7EDFAED00CD67B4C9588B4D79EAB01734B61CC4D791A45EB8;
};
struct DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF_StaticFields
{
	ListenerRegistrationMap_1_t86C1C4A777AF595737DD7CE070E15B23120B62EF* ___snapshotListenerCallbacks;
	ListenerDelegate_tAE1235754123BEFDBA5A5392D62D732DEF5B32C6* ___documentSnapshotsHandler;
};
struct SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D_StaticFields
{
	SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___U3CDefaultU3Ek__BackingField;
};
struct String_t_StaticFields
{
	String_t* ___Empty;
};
struct Boolean_t09A6377A54BE2F9E6985A8149F19234FD7DDFE22_StaticFields
{
	String_t* ___TrueString;
	String_t* ___FalseString;
};
struct DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D_StaticFields
{
	Int32U5BU5D_t19C97395396A72ECAF310612F0760F165060314C* ___s_daysToMonth365;
	Int32U5BU5D_t19C97395396A72ECAF310612F0760F165060314C* ___s_daysToMonth366;
	DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D ___MinValue;
	DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D ___MaxValue;
	DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D ___UnixEpoch;
};
struct Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_StaticFields
{
	DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D ___s_unixEpoch;
};
struct DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4_StaticFields
{
	DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4 ___MinValue;
	DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4 ___MaxValue;
	DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4 ___UnixEpoch;
};
struct Type_t_StaticFields
{
	Binder_t91BFCE95A7057FADF4D8A1A342AFE52872246235* ___s_defaultBinder;
	Il2CppChar ___Delimiter;
	TypeU5BU5D_t97234E1129B564EB38B8D85CAC2AD8B5B9522FFB* ___EmptyTypes;
	RuntimeObject* ___Missing;
	MemberFilter_tF644F1AE82F611B677CE1964D5A3277DDA21D553* ___FilterAttribute;
	MemberFilter_tF644F1AE82F611B677CE1964D5A3277DDA21D553* ___FilterName;
	MemberFilter_tF644F1AE82F611B677CE1964D5A3277DDA21D553* ___FilterNameIgnoreCase;
};
#ifdef __clang__
#pragma clang diagnostic pop
#endif
struct ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031  : public RuntimeArray
{
	ALIGN_FIELD (8) uint8_t m_Items[1];

	inline uint8_t GetAt(il2cpp_array_size_t index) const
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items[index];
	}
	inline uint8_t* GetAddressAt(il2cpp_array_size_t index)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items + index;
	}
	inline void SetAt(il2cpp_array_size_t index, uint8_t value)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		m_Items[index] = value;
	}
	inline uint8_t GetAtUnchecked(il2cpp_array_size_t index) const
	{
		return m_Items[index];
	}
	inline uint8_t* GetAddressAtUnchecked(il2cpp_array_size_t index)
	{
		return m_Items + index;
	}
	inline void SetAtUnchecked(il2cpp_array_size_t index, uint8_t value)
	{
		m_Items[index] = value;
	}
};


IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Dictionary_2__ctor_m5B32FBC624618211EB461D59CFBB10E987FD1329_gshared (Dictionary_2_t14FE4A752A83D53771C584E4C8D14E01F2AFD7BA* __this, const RuntimeMethod* method) ;

IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE (ConverterBase_t2EB97002817F3AC30B2E04CA0D0878DA5D26A986* __this, Type_t* ___0_targetType, const RuntimeMethod* method) ;
inline void Dictionary_2__ctor_mEFBE7A31B17F88B49904A09737C23C6D9489E210 (Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8* __this, const RuntimeMethod* method)
{
	((  void (*) (Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8*, const RuntimeMethod*))Dictionary_2__ctor_m5B32FBC624618211EB461D59CFBB10E987FD1329_gshared)(__this, method);
}
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* ConverterBase_ConvertToProxyMap_m765B9DDCD60793910D785A66FFE3B2D678A7A48D (RuntimeObject* ___0_map, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR Type_t* Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57 (RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B ___0_handle, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* FieldValueProxy_String_m45A5D4AF9B37E93E7AA12DF0984BC669729F228C (String_t* ___0_value, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F (IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749* __this, Type_t* ___0_type, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* FieldValueProxy_Integer_m6AC6B4312C9F6FE596EB30CAC84F75F9BA2DF1E6 (int64_t ___0_value, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* FieldValueProxy_Double_m76A3BCA369286127F50850D75F414C2317E2E1F5 (double ___0_value, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* FieldValueProxy_Boolean_mEF3E203D36D40EBB1F75F2C0F22D360946BB42ED (bool ___0_value, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR TimestampProxy_t62B4D8B5017180CFD050625E52B3F07CB596BFC3* Timestamp_ConvertToProxy_mFFE2890F49BC2F29631E02573F4EA3DA50DBEA96 (Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3* __this, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* FieldValueProxy_Timestamp_mAAD511133BE8E83375DFA072072CACCE16EE8DE9 (TimestampProxy_t62B4D8B5017180CFD050625E52B3F07CB596BFC3* ___0_value, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR GeoPointProxy_t01FBB939675E91CACA5D94712514DA430CD46968* GeoPoint_ConvertToProxy_mCDD545EB1CF5E75BB2C427B1DB0EA4BA9EC79A1B (GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0* __this, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* FieldValueProxy_GeoPoint_m2CC1F9750816A0272DD76676D37E3A985080D567 (GeoPointProxy_t01FBB939675E91CACA5D94712514DA430CD46968* ___0_value, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* ConverterBase_ConvertToProxyBlob_m31ECFB2070A2EDCCC43CDD41CBEB105E9579D160 (ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031* ___0_value, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031* Blob_ToBytes_mE56B7434FF107913B005531F2B3A93696288A360 (Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35* __this, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35 Blob_CopyFrom_mFB8663B1E622D584118854CD1FC3394FFF134496 (ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031* ___0_bytes, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 Timestamp_FromDateTime_mA6D496874163B0A6323C5824B291BE8091782CB0 (DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D ___0_dateTime, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D Timestamp_ToDateTime_mDB1ACFC2FB995894CCED239A5E557CDA12F066FE (Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3* __this, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 Timestamp_FromDateTimeOffset_m1E55B744FDA745628378811D18B81551BA8B674E (DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4 ___0_dateTimeOffset, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4 Timestamp_ToDateTimeOffset_mC1AB3B395A37909C8A0E01DB07C55C0E6AD3ED46 (Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3* __this, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR DocumentReferenceProxy_t2130D62C085B6D0F09E46550D38F9BD1EEBE0F7A* DocumentReference_get_Proxy_m6D6CA54A228000E504062E43C39C05FA7ACC1485 (DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF* __this, const RuntimeMethod* method) ;
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* FieldValueProxy_Reference_mB824AA209F6327C73E4FD5752E9215AE82063743 (DocumentReferenceProxy_t2130D62C085B6D0F09E46550D38F9BD1EEBE0F7A* ___0_value, const RuntimeMethod* method) ;
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43839
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MapConverterBase__ctor_m9E9E142347C2CED0E133610BD909AABDF1EF1B00 (MapConverterBase_tB74722C6C09BD0135DB6428DBDCA720402A459E3* __this, Type_t* ___0_targetType, const RuntimeMethod* method) 
{
	{
		Type_t* L_0 = ___0_targetType;
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_0, NULL);
		return;
	}
}
// Method Definition Index: 43840
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* MapConverterBase_Serialize_mB7E80C6A7633AF0A24766CA0FAD6B1666E7EF83B (MapConverterBase_tB74722C6C09BD0135DB6428DBDCA720402A459E3* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Dictionary_2__ctor_mEFBE7A31B17F88B49904A09737C23C6D9489E210_RuntimeMethod_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8* V_0 = NULL;
	FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* V_1 = NULL;
	{
		Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8* L_0 = (Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8*)il2cpp_codegen_object_new(Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8_il2cpp_TypeInfo_var);
		Dictionary_2__ctor_mEFBE7A31B17F88B49904A09737C23C6D9489E210(L_0, Dictionary_2__ctor_mEFBE7A31B17F88B49904A09737C23C6D9489E210_RuntimeMethod_var);
		V_0 = L_0;
		SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* L_1 = ___0_context;
		RuntimeObject* L_2 = ___1_value;
		Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8* L_3 = V_0;
		VirtualActionInvoker3< SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D*, RuntimeObject*, RuntimeObject* >::Invoke(9, __this, L_1, L_2, L_3);
		Dictionary_2_t7CC7577BE304ED34533E9BABC0EB2AA8A73D2BE8* L_4 = V_0;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_5;
		L_5 = ConverterBase_ConvertToProxyMap_m765B9DDCD60793910D785A66FFE3B2D678A7A48D(L_4, NULL);
		V_1 = L_5;
		goto IL_001a;
	}

IL_001a:
	{
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_6 = V_1;
		return L_6;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43841
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void StringConverter__ctor_mB4E28DBBCB593C8B0B104E17EF3F53F8F6E2186D (StringConverter_tE3ACF1666C7A43A5ED0ED035D3A21A4527EFF33A* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.string_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43842
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* StringConverter_Serialize_mAD05799AF8CBE87E5C8D1DFCEEC51D269FAA0C32 (StringConverter_tE3ACF1666C7A43A5ED0ED035D3A21A4527EFF33A* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_String_m45A5D4AF9B37E93E7AA12DF0984BC669729F228C(((String_t*)CastclassSealed((RuntimeObject*)L_0, il2cpp_defaults.string_class)), NULL);
		return L_1;
	}
}
// Method Definition Index: 43843
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* StringConverter_DeserializeString_m5DBF8001A288190585CB573C94EFCA0EAAB79A37 (StringConverter_tE3ACF1666C7A43A5ED0ED035D3A21A4527EFF33A* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, String_t* ___1_value, const RuntimeMethod* method) 
{
	{
		String_t* L_0 = ___1_value;
		return L_0;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43844
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F (IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749* __this, Type_t* ___0_type, const RuntimeMethod* method) 
{
	{
		Type_t* L_0 = ___0_type;
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_0, NULL);
		return;
	}
}
// Method Definition Index: 43845
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* IntegerConverterBase_DeserializeDouble_mCD20BDEFC96DA44E122A69BF03A993BCA048B752 (IntegerConverterBase_tFD031194A307F60CD0CAB0368F8169B87D3B1749* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, double ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&IntegerConverterBase_DeserializeDouble_mCD20BDEFC96DA44E122A69BF03A993BCA048B752_RuntimeMethod_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* L_0 = ___0_context;
		double L_1 = ___1_value;
		if (L_1 > (double)((std::numeric_limits<int64_t>::max)())) IL2CPP_RAISE_MANAGED_EXCEPTION(il2cpp_codegen_get_overflow_exception(), IntegerConverterBase_DeserializeDouble_mCD20BDEFC96DA44E122A69BF03A993BCA048B752_RuntimeMethod_var);
		RuntimeObject* L_2;
		L_2 = VirtualFuncInvoker2< RuntimeObject*, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E*, int64_t >::Invoke(15, __this, L_0, il2cpp_codegen_cast_double_to_int<int64_t>(L_1));
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43846
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void ByteConverter__ctor_mFC325B5FD5453EFB5D7F3A362AAD6AFB135D7BAD (ByteConverter_tA676FFBC239BA57CE9A77C4CAE57A5ACA66679FC* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.byte_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43847
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* ByteConverter_Serialize_mE845263FED561D71296272B9380FC5D64175DB74 (ByteConverter_tA676FFBC239BA57CE9A77C4CAE57A5ACA66679FC* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Integer_m6AC6B4312C9F6FE596EB30CAC84F75F9BA2DF1E6(((int64_t)(uint64_t)((uint32_t)((*(uint8_t*)UnBox(L_0, il2cpp_defaults.byte_class))))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43848
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* ByteConverter_DeserializeInteger_m75366C8C52D7A8E3C45B7AD38DBAE758E8C0BA9A (ByteConverter_tA676FFBC239BA57CE9A77C4CAE57A5ACA66679FC* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&ByteConverter_DeserializeInteger_m75366C8C52D7A8E3C45B7AD38DBAE758E8C0BA9A_RuntimeMethod_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		int64_t L_0 = ___1_value;
		if ((int64_t)(L_0) > 255LL) IL2CPP_RAISE_MANAGED_EXCEPTION(il2cpp_codegen_get_overflow_exception(), ByteConverter_DeserializeInteger_m75366C8C52D7A8E3C45B7AD38DBAE758E8C0BA9A_RuntimeMethod_var);
		uint8_t L_1 = ((uint8_t)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.byte_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43849
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void SByteConverter__ctor_m8DF21A6C65A36F46C63DBBA7288B6438CB586765 (SByteConverter_t878367D86AB2143AC558AB69487A33F5FC3D7FD0* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.sbyte_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43850
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* SByteConverter_Serialize_mCCDD0AA5150C35F862D7A80EC73BD4A57DEAE25A (SByteConverter_t878367D86AB2143AC558AB69487A33F5FC3D7FD0* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Integer_m6AC6B4312C9F6FE596EB30CAC84F75F9BA2DF1E6(((int64_t)((*(int8_t*)UnBox(L_0, il2cpp_defaults.sbyte_class)))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43851
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* SByteConverter_DeserializeInteger_m756B896D761C10275AE95BB4446D5872C5FD1AD7 (SByteConverter_t878367D86AB2143AC558AB69487A33F5FC3D7FD0* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&SByteConverter_DeserializeInteger_m756B896D761C10275AE95BB4446D5872C5FD1AD7_RuntimeMethod_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		int64_t L_0 = ___1_value;
		if ((int64_t)(L_0) > 127LL) IL2CPP_RAISE_MANAGED_EXCEPTION(il2cpp_codegen_get_overflow_exception(), SByteConverter_DeserializeInteger_m756B896D761C10275AE95BB4446D5872C5FD1AD7_RuntimeMethod_var);
		int8_t L_1 = ((int8_t)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.sbyte_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43852
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Int16Converter__ctor_m5B896AE510E0FE57A2DA3F09F90706D53E01F118 (Int16Converter_t7164A70E8D6EE2EA90E75205A9D842833F195E3B* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.int16_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43853
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* Int16Converter_Serialize_mEB0028D417CBFA5D5352B64E78D731255275E009 (Int16Converter_t7164A70E8D6EE2EA90E75205A9D842833F195E3B* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Integer_m6AC6B4312C9F6FE596EB30CAC84F75F9BA2DF1E6(((int64_t)((*(int16_t*)UnBox(L_0, il2cpp_defaults.int16_class)))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43854
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* Int16Converter_DeserializeInteger_mB51802CC353F9A8092891D6FC0FE1DE6BAD31A84 (Int16Converter_t7164A70E8D6EE2EA90E75205A9D842833F195E3B* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Int16Converter_DeserializeInteger_mB51802CC353F9A8092891D6FC0FE1DE6BAD31A84_RuntimeMethod_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		int64_t L_0 = ___1_value;
		if ((int64_t)(L_0) > 32767LL) IL2CPP_RAISE_MANAGED_EXCEPTION(il2cpp_codegen_get_overflow_exception(), Int16Converter_DeserializeInteger_mB51802CC353F9A8092891D6FC0FE1DE6BAD31A84_RuntimeMethod_var);
		int16_t L_1 = ((int16_t)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.int16_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43855
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void UInt16Converter__ctor_m5613B6AC8405974D2174FF9D7B48397752CA1F33 (UInt16Converter_tDC237C86A6C6C07A47254910EACA583EF49DCF97* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.uint16_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43856
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* UInt16Converter_Serialize_m5DBA714FA86017847C15971F9F7244AE25438F07 (UInt16Converter_tDC237C86A6C6C07A47254910EACA583EF49DCF97* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Integer_m6AC6B4312C9F6FE596EB30CAC84F75F9BA2DF1E6(((int64_t)(uint64_t)((uint32_t)((*(uint16_t*)UnBox(L_0, il2cpp_defaults.uint16_class))))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43857
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* UInt16Converter_DeserializeInteger_mBB92F046B498A47235E6D5C61E1D4DF5D139D71A (UInt16Converter_tDC237C86A6C6C07A47254910EACA583EF49DCF97* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&UInt16Converter_DeserializeInteger_mBB92F046B498A47235E6D5C61E1D4DF5D139D71A_RuntimeMethod_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		int64_t L_0 = ___1_value;
		if ((int64_t)(L_0) > 65535LL) IL2CPP_RAISE_MANAGED_EXCEPTION(il2cpp_codegen_get_overflow_exception(), UInt16Converter_DeserializeInteger_mBB92F046B498A47235E6D5C61E1D4DF5D139D71A_RuntimeMethod_var);
		uint16_t L_1 = ((uint16_t)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.uint16_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43858
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Int32Converter__ctor_m694D9FF17B5E75F13744C0685A0056EEAB449C79 (Int32Converter_t57F1559BACE26877F76CE073B9A5614C37377587* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.int32_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43859
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* Int32Converter_Serialize_m6CB3D05E398607DA371365687C921D60793B55C8 (Int32Converter_t57F1559BACE26877F76CE073B9A5614C37377587* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Integer_m6AC6B4312C9F6FE596EB30CAC84F75F9BA2DF1E6(((int64_t)((*(int32_t*)UnBox(L_0, il2cpp_defaults.int32_class)))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43860
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* Int32Converter_DeserializeInteger_m0CBD454EA743313EF45C767D24B33D90CA1837D9 (Int32Converter_t57F1559BACE26877F76CE073B9A5614C37377587* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Int32Converter_DeserializeInteger_m0CBD454EA743313EF45C767D24B33D90CA1837D9_RuntimeMethod_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		int64_t L_0 = ___1_value;
		if ((int64_t)(L_0) > 2147483647LL) IL2CPP_RAISE_MANAGED_EXCEPTION(il2cpp_codegen_get_overflow_exception(), Int32Converter_DeserializeInteger_m0CBD454EA743313EF45C767D24B33D90CA1837D9_RuntimeMethod_var);
		int32_t L_1 = ((int32_t)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.int32_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43861
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void UInt32Converter__ctor_m3F47AFC41ABC2B161B86393D06ECD6566D6614B8 (UInt32Converter_t37920E7844B75328507C6A82EB007A86F1892151* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.uint32_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43862
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* UInt32Converter_Serialize_m65D2992F8EA3AE748D73E82C1C224CFE101755A1 (UInt32Converter_t37920E7844B75328507C6A82EB007A86F1892151* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Integer_m6AC6B4312C9F6FE596EB30CAC84F75F9BA2DF1E6(((int64_t)(uint64_t)((uint32_t)((*(uint32_t*)UnBox(L_0, il2cpp_defaults.uint32_class))))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43863
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* UInt32Converter_DeserializeInteger_m26885822BC645607B2FB01500B8173B823A3441A (UInt32Converter_t37920E7844B75328507C6A82EB007A86F1892151* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&UInt32Converter_DeserializeInteger_m26885822BC645607B2FB01500B8173B823A3441A_RuntimeMethod_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		int64_t L_0 = ___1_value;
		if ((int64_t)(L_0) > 4294967295LL) IL2CPP_RAISE_MANAGED_EXCEPTION(il2cpp_codegen_get_overflow_exception(), UInt32Converter_DeserializeInteger_m26885822BC645607B2FB01500B8173B823A3441A_RuntimeMethod_var);
		uint32_t L_1 = ((uint32_t)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.uint32_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43864
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Int64Converter__ctor_m24A6E97DFF8EC0E1647DA0CFFD9580C9FC5060CF (Int64Converter_t68449D8D48F5695BD5DBB8BFD31257B5C8B20953* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.int64_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43865
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* Int64Converter_Serialize_m5B7EAE187FF1087C7FD298C95B6F349313893BEE (Int64Converter_t68449D8D48F5695BD5DBB8BFD31257B5C8B20953* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Integer_m6AC6B4312C9F6FE596EB30CAC84F75F9BA2DF1E6(((*(int64_t*)UnBox(L_0, il2cpp_defaults.int64_class))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43866
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* Int64Converter_DeserializeInteger_m7CB1F3B783A49669BDB04A2F227633189808AFFA (Int64Converter_t68449D8D48F5695BD5DBB8BFD31257B5C8B20953* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	{
		int64_t L_0 = ___1_value;
		int64_t L_1 = L_0;
		RuntimeObject* L_2 = Box(il2cpp_defaults.int64_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43867
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void UInt64Converter__ctor_m5B5B8D8F20ED9558D4E25A55719AE79AAA8A2C70 (UInt64Converter_tA7BED8E18DDF9AFC86E767A972832A7A820A566C* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.uint64_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		IntegerConverterBase__ctor_mA9476A3DF7B140631E1386724E61EA81FFE0893F(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43868
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* UInt64Converter_Serialize_m7FDD59769F82F3CDFD20C55D20E5684D34A03CCD (UInt64Converter_tA7BED8E18DDF9AFC86E767A972832A7A820A566C* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Integer_m6AC6B4312C9F6FE596EB30CAC84F75F9BA2DF1E6(((*(uint64_t*)UnBox(L_0, il2cpp_defaults.uint64_class))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43869
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* UInt64Converter_DeserializeInteger_mC2073BA9F288A43CB50EDC0AF8D596DFD933F893 (UInt64Converter_tA7BED8E18DDF9AFC86E767A972832A7A820A566C* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&UInt64Converter_DeserializeInteger_mC2073BA9F288A43CB50EDC0AF8D596DFD933F893_RuntimeMethod_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		int64_t L_0 = ___1_value;
		if ((uint64_t)(L_0) > (std::numeric_limits<uint64_t>::max)()) IL2CPP_RAISE_MANAGED_EXCEPTION(il2cpp_codegen_get_overflow_exception(), UInt64Converter_DeserializeInteger_mC2073BA9F288A43CB50EDC0AF8D596DFD933F893_RuntimeMethod_var);
		uint64_t L_1 = ((uint64_t)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.uint64_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43870
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void SingleConverter__ctor_m9086CBD151FBB44D1B11545223F5D8829E843BBC (SingleConverter_t5DB6880D844DEC4685528999AAF0F251516DE639* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.single_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43871
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* SingleConverter_Serialize_m1DFF98D5229ABF0616828F2BD4AE6979BF664616 (SingleConverter_t5DB6880D844DEC4685528999AAF0F251516DE639* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Double_m76A3BCA369286127F50850D75F414C2317E2E1F5(((double)((*(float*)UnBox(L_0, il2cpp_defaults.single_class)))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43872
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* SingleConverter_DeserializeDouble_mB961241C8778BB908BE597342F00B6D98C0C1AA1 (SingleConverter_t5DB6880D844DEC4685528999AAF0F251516DE639* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, double ___1_value, const RuntimeMethod* method) 
{
	{
		double L_0 = ___1_value;
		float L_1 = ((float)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.single_class, &L_1);
		return L_2;
	}
}
// Method Definition Index: 43873
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* SingleConverter_DeserializeInteger_m13F0D4799B0A00DC8ED8DC14B5FC787AC23A185C (SingleConverter_t5DB6880D844DEC4685528999AAF0F251516DE639* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	{
		int64_t L_0 = ___1_value;
		float L_1 = ((float)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.single_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43874
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void DoubleConverter__ctor_mF5F5573F321FDA0AB37ECB051B22BE83F4CE5931 (DoubleConverter_t6E78FF273149A7409508A304891B4322DDF611B4* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.double_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43875
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* DoubleConverter_Serialize_mD1FCD799FB5216CEE9EBEDF3449B9463959E77E8 (DoubleConverter_t6E78FF273149A7409508A304891B4322DDF611B4* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Double_m76A3BCA369286127F50850D75F414C2317E2E1F5(((*(double*)UnBox(L_0, il2cpp_defaults.double_class))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43876
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* DoubleConverter_DeserializeDouble_mE7A5F318C5A25C9482DFF813FD9D2C43DE6D0932 (DoubleConverter_t6E78FF273149A7409508A304891B4322DDF611B4* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, double ___1_value, const RuntimeMethod* method) 
{
	{
		double L_0 = ___1_value;
		double L_1 = L_0;
		RuntimeObject* L_2 = Box(il2cpp_defaults.double_class, &L_1);
		return L_2;
	}
}
// Method Definition Index: 43877
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* DoubleConverter_DeserializeInteger_mD127B2E56D574E946745ADB0F426590481C3FAE4 (DoubleConverter_t6E78FF273149A7409508A304891B4322DDF611B4* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, int64_t ___1_value, const RuntimeMethod* method) 
{
	{
		int64_t L_0 = ___1_value;
		double L_1 = ((double)L_0);
		RuntimeObject* L_2 = Box(il2cpp_defaults.double_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43878
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void BooleanConverter__ctor_mBDD68794FE108535DE5042C1A0CC225566321AE5 (BooleanConverter_t413CD06B6AFB2069B97F4F69B4D5B54A7103F43E* __this, const RuntimeMethod* method) 
{
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (&il2cpp_defaults.boolean_class->byval_arg) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43879
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* BooleanConverter_Serialize_mC534965D963068175B19BAFA569AF87764491CD3 (BooleanConverter_t413CD06B6AFB2069B97F4F69B4D5B54A7103F43E* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = FieldValueProxy_Boolean_mEF3E203D36D40EBB1F75F2C0F22D360946BB42ED(((*(bool*)UnBox(L_0, il2cpp_defaults.boolean_class))), NULL);
		return L_1;
	}
}
// Method Definition Index: 43880
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* BooleanConverter_DeserializeBoolean_mB6489961CAABF117124CFFF48E1EBF3202514795 (BooleanConverter_t413CD06B6AFB2069B97F4F69B4D5B54A7103F43E* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, bool ___1_value, const RuntimeMethod* method) 
{
	{
		bool L_0 = ___1_value;
		bool L_1 = L_0;
		RuntimeObject* L_2 = Box(il2cpp_defaults.boolean_class, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43881
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void TimestampConverter__ctor_m26273B8B45C7E5B7CC011C58FE93131E2C53367B (TimestampConverter_t334CE72D4B7105AA99405E53ADC81B5C4C246D1E* __this, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_0_0_0_var) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43882
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* TimestampConverter_Serialize_m9B0B0EE5DDDA8CA76D18AF0CAB23B0FCC4DE8670 (TimestampConverter_t334CE72D4B7105AA99405E53ADC81B5C4C246D1E* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 V_0;
	memset((&V_0), 0, sizeof(V_0));
	{
		RuntimeObject* L_0 = ___1_value;
		V_0 = ((*(Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3*)UnBox(L_0, Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var)));
		il2cpp_codegen_runtime_class_init_inline(Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		TimestampProxy_t62B4D8B5017180CFD050625E52B3F07CB596BFC3* L_1;
		L_1 = Timestamp_ConvertToProxy_mFFE2890F49BC2F29631E02573F4EA3DA50DBEA96((&V_0), NULL);
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_2;
		L_2 = FieldValueProxy_Timestamp_mAAD511133BE8E83375DFA072072CACCE16EE8DE9(L_1, NULL);
		return L_2;
	}
}
// Method Definition Index: 43883
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* TimestampConverter_DeserializeTimestamp_m70421B48E029A0B0DC1E16E22A1E79A2CFB8AB17 (TimestampConverter_t334CE72D4B7105AA99405E53ADC81B5C4C246D1E* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 L_0 = ___1_value;
		Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 L_1 = L_0;
		RuntimeObject* L_2 = Box(Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43884
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void GeoPointConverter__ctor_mA78116EE37089A80A2CC01CFBE3E015EB11DED71 (GeoPointConverter_tC63DED3B80C043912E1370DE8FA78D76902967FF* __this, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0_0_0_0_var) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43885
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* GeoPointConverter_Serialize_mCE7DED2E9B1DFFFF3204F9C87EFCEB69F5B70A89 (GeoPointConverter_tC63DED3B80C043912E1370DE8FA78D76902967FF* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0 V_0;
	memset((&V_0), 0, sizeof(V_0));
	{
		RuntimeObject* L_0 = ___1_value;
		V_0 = ((*(GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0*)UnBox(L_0, GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0_il2cpp_TypeInfo_var)));
		GeoPointProxy_t01FBB939675E91CACA5D94712514DA430CD46968* L_1;
		L_1 = GeoPoint_ConvertToProxy_mCDD545EB1CF5E75BB2C427B1DB0EA4BA9EC79A1B((&V_0), NULL);
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_2;
		L_2 = FieldValueProxy_GeoPoint_m2CC1F9750816A0272DD76676D37E3A985080D567(L_1, NULL);
		return L_2;
	}
}
// Method Definition Index: 43886
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* GeoPointConverter_DeserializeGeoPoint_m9EB968D578A7ED2DB9CCED057D36A7CED8F1D7B4 (GeoPointConverter_tC63DED3B80C043912E1370DE8FA78D76902967FF* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0 ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0 L_0 = ___1_value;
		GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0 L_1 = L_0;
		RuntimeObject* L_2 = Box(GeoPoint_tACACE5A3D70BEDDF601A80CBCC66735A1D9A96E0_il2cpp_TypeInfo_var, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43887
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void ByteArrayConverter__ctor_mBD1F09EBAB7411960681E0A080DDC43CCB47EE5C (ByteArrayConverter_tFC576D6F861A6A5D054DD2D1C14D90FD491309ED* __this, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031_0_0_0_var) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43888
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* ByteArrayConverter_Serialize_mE6D4DFBC356AB944C030B000948563A4C0E8F21E (ByteArrayConverter_tFC576D6F861A6A5D054DD2D1C14D90FD491309ED* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeObject* L_0 = ___1_value;
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_1;
		L_1 = ConverterBase_ConvertToProxyBlob_m31ECFB2070A2EDCCC43CDD41CBEB105E9579D160(((ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031*)Castclass((RuntimeObject*)L_0, ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031_il2cpp_TypeInfo_var)), NULL);
		return L_1;
	}
}
// Method Definition Index: 43889
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* ByteArrayConverter_DeserializeBytes_m8999DBC45439623A82D6BC8C3988A3389D929533 (ByteArrayConverter_tFC576D6F861A6A5D054DD2D1C14D90FD491309ED* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031* ___1_value, const RuntimeMethod* method) 
{
	{
		ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031* L_0 = ___1_value;
		return (RuntimeObject*)L_0;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43890
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void BlobConverter__ctor_m8142753A6C7B938E154FBFEFCC4438C53E41A0D0 (BlobConverter_t7A6588D9EF3D39EEC09A6193CDF832D15A2EBC6D* __this, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_0_0_0_var) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43891
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* BlobConverter_Serialize_mD5F5AF5A2F5E68F73CE0B0E8AD01D54A0BC5636D (BlobConverter_t7A6588D9EF3D39EEC09A6193CDF832D15A2EBC6D* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35 V_0;
	memset((&V_0), 0, sizeof(V_0));
	{
		RuntimeObject* L_0 = ___1_value;
		V_0 = ((*(Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35*)UnBox(L_0, Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_il2cpp_TypeInfo_var)));
		ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031* L_1;
		L_1 = Blob_ToBytes_mE56B7434FF107913B005531F2B3A93696288A360((&V_0), NULL);
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_2;
		L_2 = ConverterBase_ConvertToProxyBlob_m31ECFB2070A2EDCCC43CDD41CBEB105E9579D160(L_1, NULL);
		return L_2;
	}
}
// Method Definition Index: 43892
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* BlobConverter_DeserializeBytes_m9FC7288F6F81B7EBA73F3933273B09B2F56687B7 (BlobConverter_t7A6588D9EF3D39EEC09A6193CDF832D15A2EBC6D* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		ByteU5BU5D_tA6237BF417AE52AD70CFB4EF24A7A82613DF9031* L_0 = ___1_value;
		Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35 L_1;
		L_1 = Blob_CopyFrom_mFB8663B1E622D584118854CD1FC3394FFF134496(L_0, NULL);
		Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35 L_2 = L_1;
		RuntimeObject* L_3 = Box(Blob_t313307C797F1440CD0FA87FFC0A9BDB9EA865E35_il2cpp_TypeInfo_var, &L_2);
		return L_3;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43893
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void FieldValueProxyConverter__ctor_m414C822AA810FFEFB76C3D47E0A7B07962D6B3F3 (FieldValueProxyConverter_t8075153C7E9CB3F49FE2D8F52755947F9751897F* __this, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26_0_0_0_var) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43894
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* FieldValueProxyConverter_Serialize_mF8D266B7428391B0FC96BFB5F0AA5572B19C72D9 (FieldValueProxyConverter_t8075153C7E9CB3F49FE2D8F52755947F9751897F* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeObject* L_0 = ___1_value;
		return ((FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26*)CastclassClass((RuntimeObject*)L_0, FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26_il2cpp_TypeInfo_var));
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43895
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void DateTimeConverter__ctor_m0FEEC838E0893B955D2ADA84D073F2E90D396294 (DateTimeConverter_t414F0BA1D7E783E6AA182523D5A665E835379C4F* __this, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D_0_0_0_var) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43896
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* DateTimeConverter_Serialize_m9FAAB46144459F6B24B0B49A38A1F04AD4581A0B (DateTimeConverter_t414F0BA1D7E783E6AA182523D5A665E835379C4F* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D_il2cpp_TypeInfo_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 V_0;
	memset((&V_0), 0, sizeof(V_0));
	{
		RuntimeObject* L_0 = ___1_value;
		il2cpp_codegen_runtime_class_init_inline(Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 L_1;
		L_1 = Timestamp_FromDateTime_mA6D496874163B0A6323C5824B291BE8091782CB0(((*(DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D*)UnBox(L_0, DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D_il2cpp_TypeInfo_var))), NULL);
		V_0 = L_1;
		TimestampProxy_t62B4D8B5017180CFD050625E52B3F07CB596BFC3* L_2;
		L_2 = Timestamp_ConvertToProxy_mFFE2890F49BC2F29631E02573F4EA3DA50DBEA96((&V_0), NULL);
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_3;
		L_3 = FieldValueProxy_Timestamp_mAAD511133BE8E83375DFA072072CACCE16EE8DE9(L_2, NULL);
		return L_3;
	}
}
// Method Definition Index: 43897
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* DateTimeConverter_DeserializeTimestamp_m1818DB588574DAFC5EA11EEE574F2CEE4354C098 (DateTimeConverter_t414F0BA1D7E783E6AA182523D5A665E835379C4F* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D_il2cpp_TypeInfo_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		il2cpp_codegen_runtime_class_init_inline(Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D L_0;
		L_0 = Timestamp_ToDateTime_mDB1ACFC2FB995894CCED239A5E557CDA12F066FE((&___1_value), NULL);
		DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D L_1 = L_0;
		RuntimeObject* L_2 = Box(DateTime_t66193957C73913903DDAD89FEDC46139BCA5802D_il2cpp_TypeInfo_var, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43898
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void DateTimeOffsetConverter__ctor_m6692EC537B17F33E0C4C08260AD10F605CD152DB (DateTimeOffsetConverter_tAD4C59B3E28745F5A1E340FFE014D257CD29887F* __this, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4_0_0_0_var) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43899
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* DateTimeOffsetConverter_Serialize_mE9E188E43CA145481167683AE727B6C5E1AC2DD9 (DateTimeOffsetConverter_tAD4C59B3E28745F5A1E340FFE014D257CD29887F* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4_il2cpp_TypeInfo_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 V_0;
	memset((&V_0), 0, sizeof(V_0));
	{
		RuntimeObject* L_0 = ___1_value;
		il2cpp_codegen_runtime_class_init_inline(Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 L_1;
		L_1 = Timestamp_FromDateTimeOffset_m1E55B744FDA745628378811D18B81551BA8B674E(((*(DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4*)UnBox(L_0, DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4_il2cpp_TypeInfo_var))), NULL);
		V_0 = L_1;
		TimestampProxy_t62B4D8B5017180CFD050625E52B3F07CB596BFC3* L_2;
		L_2 = Timestamp_ConvertToProxy_mFFE2890F49BC2F29631E02573F4EA3DA50DBEA96((&V_0), NULL);
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_3;
		L_3 = FieldValueProxy_Timestamp_mAAD511133BE8E83375DFA072072CACCE16EE8DE9(L_2, NULL);
		return L_3;
	}
}
// Method Definition Index: 43900
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* DateTimeOffsetConverter_DeserializeTimestamp_m0CAF92C2407C86FA8186C6C266762FE02EE436EB (DateTimeOffsetConverter_tAD4C59B3E28745F5A1E340FFE014D257CD29887F* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3 ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4_il2cpp_TypeInfo_var);
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		il2cpp_codegen_runtime_class_init_inline(Timestamp_t9C2EDAE46B1BB2C0844C483B8BC464DAEDF237C3_il2cpp_TypeInfo_var);
		DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4 L_0;
		L_0 = Timestamp_ToDateTimeOffset_mC1AB3B395A37909C8A0E01DB07C55C0E6AD3ED46((&___1_value), NULL);
		DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4 L_1 = L_0;
		RuntimeObject* L_2 = Box(DateTimeOffset_t4EE701FE2F386D6F932FAC9B11E4B74A5B30F0A4_il2cpp_TypeInfo_var, &L_1);
		return L_2;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Method Definition Index: 43901
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void DocumentReferenceConverter__ctor_m944C476BC390D26369F42B3ADC85A158A99F7059 (DocumentReferenceConverter_t77C4B95A6C934F7341FA4093848C74595B1926E5* __this, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF_0_0_0_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeTypeHandle_t332A452B8B6179E4469B69525D0FE82A88030F7B L_0 = { reinterpret_cast<intptr_t> (DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF_0_0_0_var) };
		il2cpp_codegen_runtime_class_init_inline(il2cpp_defaults.systemtype_class);
		Type_t* L_1;
		L_1 = Type_GetTypeFromHandle_m6062B81682F79A4D6DF2640692EE6D9987858C57(L_0, NULL);
		ConverterBase__ctor_m0D2AA36F632B6CAE14B9AF2F314AE5A6296790DE(__this, L_1, NULL);
		return;
	}
}
// Method Definition Index: 43902
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* DocumentReferenceConverter_Serialize_m7B8549F0E454701D2F3AD64EBEA45A7EED11697C (DocumentReferenceConverter_t77C4B95A6C934F7341FA4093848C74595B1926E5* __this, SerializationContext_tF76E37F73D99EBEE5B9896B738537415F921B19D* ___0_context, RuntimeObject* ___1_value, const RuntimeMethod* method) 
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_runtime_metadata((uintptr_t*)&DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF_il2cpp_TypeInfo_var);
		s_Il2CppMethodInitialized = true;
	}
	{
		RuntimeObject* L_0 = ___1_value;
		NullCheck(((DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF*)CastclassSealed((RuntimeObject*)L_0, DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF_il2cpp_TypeInfo_var)));
		DocumentReferenceProxy_t2130D62C085B6D0F09E46550D38F9BD1EEBE0F7A* L_1;
		L_1 = DocumentReference_get_Proxy_m6D6CA54A228000E504062E43C39C05FA7ACC1485(((DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF*)CastclassSealed((RuntimeObject*)L_0, DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF_il2cpp_TypeInfo_var)), NULL);
		FieldValueProxy_t9D6AD5742313557D895018060117AB42F7419B26* L_2;
		L_2 = FieldValueProxy_Reference_mB824AA209F6327C73E4FD5752E9215AE82063743(L_1, NULL);
		return L_2;
	}
}
// Method Definition Index: 43903
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* DocumentReferenceConverter_DeserializeReference_mEEB648CEA7BBAF559C1DA6237CEFD6517FEFBBE0 (DocumentReferenceConverter_t77C4B95A6C934F7341FA4093848C74595B1926E5* __this, DeserializationContext_tD91A57F55C84DA8F2696342811D9EC1FCCE2BE8E* ___0_context, DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF* ___1_value, const RuntimeMethod* method) 
{
	{
		DocumentReference_t771D97F07262D859FCE27B0C344AB1E54F6FFFCF* L_0 = ___1_value;
		return L_0;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
