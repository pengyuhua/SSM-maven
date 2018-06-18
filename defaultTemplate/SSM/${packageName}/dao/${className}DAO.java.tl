package ${data.packageName}.dao;

import java.util.List;
import java.util.Map;

import ${data.packageName}.dto.${data.className}DTO;

/**
 * 类描述:     [${data.describe}数据处理接口]
 * 创建人:     [${data.author}]
 * 创建时间:   [${date(),"yyyy-MM-dd HH:mm:ss"}]
 * 版本:       [v1.0]
 */
public interface ${data.className}DAO {

	/**
	 * 根据ID查询${data.describe}
	 */
	${data.className}DTO get${data.className}ById(long id);

	/**
	 * 根据条件查询${data.describe}列表
	 */
	List<${data.className}DTO> get${data.className}List(Map<Object,Object> condition);

	/**
	 * 查询${data.describe}的列表总数
	 */
	long get${data.className}ListCount(Map<Object,Object> condition);

	/**
	 * 新增${data.describe}
	 */
	long add${data.className}(${data.className}DTO ${data.lowerClassName}DTO);

	/**
	 * 更新${data.describe}
	 */
	long update${data.className}(${data.className}DTO ${data.lowerClassName}DTO);

	/**
	 * 删除${data.describe}
	 */
	long delete${data.className}ById(long id);

	@if(data.tableInfo.logicDel){
    /**
     * 逻辑删除${data.describe}
     */
     long logicDelete${data.className}ById(long id);
    @}

}
