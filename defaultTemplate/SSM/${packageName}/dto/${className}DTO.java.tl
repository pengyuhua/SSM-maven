@DIRECTIVE SAFE_OUTPUT_OPEN;
package ${data.packageName}.dto;

import java.util.Date;
import java.math.BigDecimal;

/**
 * Explain:     [${data.describe!}实体类]
 * Date:        [${date(),"yyyy-MM-dd HH:mm:ss"}]
 * Coder:       [${data.author!}]
 * Version:     [1.0]
 */
public class ${data.className}DTO {

@for(c in data.columns){
    @if(isNotEmpty(c.simpleColumnComment)){
    /**${c.simpleColumnComment}*/
    @}
    private ${c.baseJavaType} ${c.property};
@}
    public ${data.className}DTO() {
        super();
    }
    
@for(c in data.columns){
    public ${c.baseJavaType} get${c.upperProperty}() {
        return this.${c.property};
    }

    public void set${c.upperProperty}(${c.baseJavaType} ${c.property}) {
        this.${c.property} = ${c.property};
    }

@}
    public String toString(){
        StringBuilder strBuf = new StringBuilder("${data.className}DTO{\n");
@for(c in data.columns){
    @if(cLP.last){
        strBuf.append("${c.property}:").append(this.${c.property}).append("\n");
    @} else {
        strBuf.append("${c.property}:").append(this.${c.property}).append(",\n");
    @}
@}
        strBuf.append("}");
        return strBuf.toString();
    }
}
