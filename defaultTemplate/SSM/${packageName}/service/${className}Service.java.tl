package ${data.packageName}.service;

import java.util.List;
import java.util.Map;

import ${data.packageName}.dto.${data.className}DTO;

/**
 * 类描述:     [${data.describe}业务接口]
 * 创建人:     [${data.author}]
 * 创建时间:   [${date(),"yyyy-MM-dd HH:mm:ss"}]
 * 版本:       [v1.0]
 */
public interface ${data.className}Service {

	/**
	 * 根据ID获取${data.describe}
	 */
	${data.className}DTO get${data.className}ById(long id);

	/**
	 * 根据条件获取${data.describe}列表
	 */
	List<${data.className}DTO> get${data.className}List(Map condition);

	/**
	 * 获取${data.describe}的列表总数
	 */
	long get${data.className}ListCount(Map condition);

	/**
	 * 新增${data.describe}
	 */
	long add${data.className}(${data.className}DTO ${data.lowerClassName}DTO);

	/**
	 * 更新${data.describe}
	 */
	long update${data.className}(${data.className}DTO ${data.lowerClassName}DTO) throws Exception;

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
