package com.ruoyi.FollowSys.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药物记录对象 drug_catalog
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class DrugCatalog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 药物记录号 */
    private Long drugId;

    /** 药物名称 */
    @Excel(name = "药物名称")
    private String name;

    /** 药物品牌 */
    @Excel(name = "药物品牌")
    private String brand;

    /** 药物类型 */
    @Excel(name = "药物类型")
    private String type;

    /** 类固醇 */
    @Excel(name = "类固醇")
    private Integer isSteroid;

    /** 抗组胺药 */
    @Excel(name = "抗组胺药")
    private Integer isAntihistamine;

    /** 白三体受体拮抗剂 */
    @Excel(name = "白三体受体拮抗剂")
    private Integer isLtra;

    /** 支气管扩张剂 */
    @Excel(name = "支气管扩张剂")
    private Integer isBronchodilator;

    /** 抗生素 */
    @Excel(name = "抗生素")
    private Integer isAntibiotic;

    /** 外用软膏 */
    @Excel(name = "外用软膏")
    private Integer isTopical;

    /** 鼻用糖皮质激素 */
    @Excel(name = "鼻用糖皮质激素")
    private Integer isNasal;

    /** 祛痰药 */
    @Excel(name = "祛痰药")
    private Integer isExpectorant;

    /** 过敏源特异性免疫治疗 */
    @Excel(name = "过敏源特异性免疫治疗")
    private Integer isImmunotherapy;

    /** 抗免疫球蛋白E治疗 */
    @Excel(name = "抗免疫球蛋白E治疗")
    private Integer isAntiIge;

    /** 靶向治疗 */
    @Excel(name = "靶向治疗")
    private Integer isTargeted;

    public void setDrugId(Long drugId) 
    {
        this.drugId = drugId;
    }

    public Long getDrugId() 
    {
        return drugId;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setBrand(String brand) 
    {
        this.brand = brand;
    }

    public String getBrand() 
    {
        return brand;
    }

    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    public void setIsSteroid(Integer isSteroid) 
    {
        this.isSteroid = isSteroid;
    }

    public Integer getIsSteroid() 
    {
        return isSteroid;
    }

    public void setIsAntihistamine(Integer isAntihistamine) 
    {
        this.isAntihistamine = isAntihistamine;
    }

    public Integer getIsAntihistamine() 
    {
        return isAntihistamine;
    }

    public void setIsLtra(Integer isLtra) 
    {
        this.isLtra = isLtra;
    }

    public Integer getIsLtra() 
    {
        return isLtra;
    }

    public void setIsBronchodilator(Integer isBronchodilator) 
    {
        this.isBronchodilator = isBronchodilator;
    }

    public Integer getIsBronchodilator() 
    {
        return isBronchodilator;
    }

    public void setIsAntibiotic(Integer isAntibiotic) 
    {
        this.isAntibiotic = isAntibiotic;
    }

    public Integer getIsAntibiotic() 
    {
        return isAntibiotic;
    }

    public void setIsTopical(Integer isTopical) 
    {
        this.isTopical = isTopical;
    }

    public Integer getIsTopical() 
    {
        return isTopical;
    }

    public void setIsNasal(Integer isNasal) 
    {
        this.isNasal = isNasal;
    }

    public Integer getIsNasal() 
    {
        return isNasal;
    }

    public void setIsExpectorant(Integer isExpectorant) 
    {
        this.isExpectorant = isExpectorant;
    }

    public Integer getIsExpectorant() 
    {
        return isExpectorant;
    }

    public void setIsImmunotherapy(Integer isImmunotherapy) 
    {
        this.isImmunotherapy = isImmunotherapy;
    }

    public Integer getIsImmunotherapy() 
    {
        return isImmunotherapy;
    }

    public void setIsAntiIge(Integer isAntiIge) 
    {
        this.isAntiIge = isAntiIge;
    }

    public Integer getIsAntiIge() 
    {
        return isAntiIge;
    }

    public void setIsTargeted(Integer isTargeted) 
    {
        this.isTargeted = isTargeted;
    }

    public Integer getIsTargeted() 
    {
        return isTargeted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("drugId", getDrugId())
            .append("name", getName())
            .append("brand", getBrand())
            .append("type", getType())
            .append("isSteroid", getIsSteroid())
            .append("isAntihistamine", getIsAntihistamine())
            .append("isLtra", getIsLtra())
            .append("isBronchodilator", getIsBronchodilator())
            .append("isAntibiotic", getIsAntibiotic())
            .append("isTopical", getIsTopical())
            .append("isNasal", getIsNasal())
            .append("isExpectorant", getIsExpectorant())
            .append("isImmunotherapy", getIsImmunotherapy())
            .append("isAntiIge", getIsAntiIge())
            .append("isTargeted", getIsTargeted())
            .toString();
    }
}
