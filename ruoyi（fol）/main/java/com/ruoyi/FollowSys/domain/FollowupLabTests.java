package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 实验室检查对象 followup_lab_tests
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupLabTests extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 实验室检查号 */
    private Long labtestId;

    /** 随访号 */
    @Excel(name = "随访号")
    private Long followupId;

    /** 血常规检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "血常规检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date bloodTestDate;

    /** 白细胞计数 */
    @Excel(name = "白细胞计数")
    private Long wbcCount;

    /** 中性粒细胞计数 */
    @Excel(name = "中性粒细胞计数")
    private Long neutrophilCount;

    /** 淋巴细胞计数 */
    @Excel(name = "淋巴细胞计数")
    private Long lymphocyteCount;

    /** 嗜酸性粒细胞计数 */
    @Excel(name = "嗜酸性粒细胞计数")
    private Long eosinophilCount;

    /** 中性粒细胞百分比 */
    @Excel(name = "中性粒细胞百分比")
    private Long neutrophilPercent;

    /** 淋巴细胞百分比 */
    @Excel(name = "淋巴细胞百分比")
    private Long lymphocytePercent;

    /** 嗜酸性粒细胞百分比 */
    @Excel(name = "嗜酸性粒细胞百分比")
    private Long eosinophilPercent;

    /** 血红细胞 */
    @Excel(name = "血红细胞")
    private Long hemoglobin;

    /** 红细胞计数 */
    @Excel(name = "红细胞计数")
    private Long rbcCount;

    /** 血小板 */
    @Excel(name = "血小板")
    private Long plateletCount;

    /** C反应蛋白 */
    @Excel(name = "C反应蛋白")
    private Long cReactiveProtein;

    /** 过敏原检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "过敏原检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date allergenComboTestDate;

    /** 总IgE */
    @Excel(name = "总IgE")
    private Long totalIge;

    /** 尘螨组合 */
    @Excel(name = "尘螨组合")
    private Integer dustMiteCombo;

    /** 霉菌组合 */
    @Excel(name = "霉菌组合")
    private Integer moldCombo;

    /** 宠物毛屑组合 */
    @Excel(name = "宠物毛屑组合")
    private Integer petDanderCombo;

    /** 常见食物组合 */
    @Excel(name = "常见食物组合")
    private Integer foodCombo;

    /** 坚果组合 */
    @Excel(name = "坚果组合")
    private Integer nutCombo;

    /** 过敏源单项检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "过敏源单项检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date singleAllergenTestDate;

    /** 房尘螨 */
    @Excel(name = "房尘螨")
    private Integer houseDustMite;

    /** 粉尘螨 */
    @Excel(name = "粉尘螨")
    private Integer dustMite;

    /** 花粉 */
    @Excel(name = "花粉")
    private Integer pollen;

    /** 杂草 */
    @Excel(name = "杂草")
    private Integer weed;

    /** 烟曲霉 */
    @Excel(name = "烟曲霉")
    private Integer aspergillus;

    /** 链格孢 */
    @Excel(name = "链格孢")
    private Integer alternaria;

    /** 蟑螂 */
    @Excel(name = "蟑螂")
    private Integer cockroach;

    /** 猫皮屑 */
    @Excel(name = "猫皮屑")
    private Integer catDander;

    /** 狗皮屑 */
    @Excel(name = "狗皮屑")
    private Integer dogDander;

    /** 鸡蛋白 */
    @Excel(name = "鸡蛋白")
    private Integer eggWhite;

    /** 牛奶 */
    @Excel(name = "牛奶")
    private Integer milk;

    /** 虾 */
    @Excel(name = "虾")
    private Integer shrimp;

    /** 螃蟹 */
    @Excel(name = "螃蟹")
    private Integer crab;

    /** 大豆 */
    @Excel(name = "大豆")
    private Integer soybean;

    /** 芝麻 */
    @Excel(name = "芝麻")
    private Integer sesame;

    /** 小麦 */
    @Excel(name = "小麦")
    private Integer wheat;

    /** 坚果 */
    @Excel(name = "坚果")
    private Integer nuts;

    /** 其他 */
    @Excel(name = "其他")
    private String allergenOther;

    /** 皮肤点刺试验日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "皮肤点刺试验日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date skinPrickTestDate;

    /** 房尘螨 */
    @Excel(name = "房尘螨")
    private Integer prickHouseDustMite;

    /** 粉尘螨 */
    @Excel(name = "粉尘螨")
    private Integer prickDustMite;

    /** 痰嗜酸性粒细胞检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "痰嗜酸性粒细胞检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date sputumEosinophilTestDate;

    /** 痰嗜酸性粒细胞计数 */
    @Excel(name = "痰嗜酸性粒细胞计数")
    private Long sputumEosinophilCount;

    /** 总IgE检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "总IgE检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date totalIgeRepeatTestDate;

    /** 总IgE值 */
    @Excel(name = "总IgE值")
    private Long totalIgeRepeatValue;

    public void setLabtestId(Long labtestId) 
    {
        this.labtestId = labtestId;
    }

    public Long getLabtestId() 
    {
        return labtestId;
    }

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setBloodTestDate(Date bloodTestDate) 
    {
        this.bloodTestDate = bloodTestDate;
    }

    public Date getBloodTestDate() 
    {
        return bloodTestDate;
    }

    public void setWbcCount(Long wbcCount) 
    {
        this.wbcCount = wbcCount;
    }

    public Long getWbcCount() 
    {
        return wbcCount;
    }

    public void setNeutrophilCount(Long neutrophilCount) 
    {
        this.neutrophilCount = neutrophilCount;
    }

    public Long getNeutrophilCount() 
    {
        return neutrophilCount;
    }

    public void setLymphocyteCount(Long lymphocyteCount) 
    {
        this.lymphocyteCount = lymphocyteCount;
    }

    public Long getLymphocyteCount() 
    {
        return lymphocyteCount;
    }

    public void setEosinophilCount(Long eosinophilCount) 
    {
        this.eosinophilCount = eosinophilCount;
    }

    public Long getEosinophilCount() 
    {
        return eosinophilCount;
    }

    public void setNeutrophilPercent(Long neutrophilPercent) 
    {
        this.neutrophilPercent = neutrophilPercent;
    }

    public Long getNeutrophilPercent() 
    {
        return neutrophilPercent;
    }

    public void setLymphocytePercent(Long lymphocytePercent) 
    {
        this.lymphocytePercent = lymphocytePercent;
    }

    public Long getLymphocytePercent() 
    {
        return lymphocytePercent;
    }

    public void setEosinophilPercent(Long eosinophilPercent) 
    {
        this.eosinophilPercent = eosinophilPercent;
    }

    public Long getEosinophilPercent() 
    {
        return eosinophilPercent;
    }

    public void setHemoglobin(Long hemoglobin) 
    {
        this.hemoglobin = hemoglobin;
    }

    public Long getHemoglobin() 
    {
        return hemoglobin;
    }

    public void setRbcCount(Long rbcCount) 
    {
        this.rbcCount = rbcCount;
    }

    public Long getRbcCount() 
    {
        return rbcCount;
    }

    public void setPlateletCount(Long plateletCount) 
    {
        this.plateletCount = plateletCount;
    }

    public Long getPlateletCount() 
    {
        return plateletCount;
    }

    public void setcReactiveProtein(Long cReactiveProtein) 
    {
        this.cReactiveProtein = cReactiveProtein;
    }

    public Long getcReactiveProtein() 
    {
        return cReactiveProtein;
    }

    public void setAllergenComboTestDate(Date allergenComboTestDate) 
    {
        this.allergenComboTestDate = allergenComboTestDate;
    }

    public Date getAllergenComboTestDate() 
    {
        return allergenComboTestDate;
    }

    public void setTotalIge(Long totalIge) 
    {
        this.totalIge = totalIge;
    }

    public Long getTotalIge() 
    {
        return totalIge;
    }

    public void setDustMiteCombo(Integer dustMiteCombo) 
    {
        this.dustMiteCombo = dustMiteCombo;
    }

    public Integer getDustMiteCombo() 
    {
        return dustMiteCombo;
    }

    public void setMoldCombo(Integer moldCombo) 
    {
        this.moldCombo = moldCombo;
    }

    public Integer getMoldCombo() 
    {
        return moldCombo;
    }

    public void setPetDanderCombo(Integer petDanderCombo) 
    {
        this.petDanderCombo = petDanderCombo;
    }

    public Integer getPetDanderCombo() 
    {
        return petDanderCombo;
    }

    public void setFoodCombo(Integer foodCombo) 
    {
        this.foodCombo = foodCombo;
    }

    public Integer getFoodCombo() 
    {
        return foodCombo;
    }

    public void setNutCombo(Integer nutCombo) 
    {
        this.nutCombo = nutCombo;
    }

    public Integer getNutCombo() 
    {
        return nutCombo;
    }

    public void setSingleAllergenTestDate(Date singleAllergenTestDate) 
    {
        this.singleAllergenTestDate = singleAllergenTestDate;
    }

    public Date getSingleAllergenTestDate() 
    {
        return singleAllergenTestDate;
    }

    public void setHouseDustMite(Integer houseDustMite) 
    {
        this.houseDustMite = houseDustMite;
    }

    public Integer getHouseDustMite() 
    {
        return houseDustMite;
    }

    public void setDustMite(Integer dustMite) 
    {
        this.dustMite = dustMite;
    }

    public Integer getDustMite() 
    {
        return dustMite;
    }

    public void setPollen(Integer pollen) 
    {
        this.pollen = pollen;
    }

    public Integer getPollen() 
    {
        return pollen;
    }

    public void setWeed(Integer weed) 
    {
        this.weed = weed;
    }

    public Integer getWeed() 
    {
        return weed;
    }

    public void setAspergillus(Integer aspergillus) 
    {
        this.aspergillus = aspergillus;
    }

    public Integer getAspergillus() 
    {
        return aspergillus;
    }

    public void setAlternaria(Integer alternaria) 
    {
        this.alternaria = alternaria;
    }

    public Integer getAlternaria() 
    {
        return alternaria;
    }

    public void setCockroach(Integer cockroach) 
    {
        this.cockroach = cockroach;
    }

    public Integer getCockroach() 
    {
        return cockroach;
    }

    public void setCatDander(Integer catDander) 
    {
        this.catDander = catDander;
    }

    public Integer getCatDander() 
    {
        return catDander;
    }

    public void setDogDander(Integer dogDander) 
    {
        this.dogDander = dogDander;
    }

    public Integer getDogDander() 
    {
        return dogDander;
    }

    public void setEggWhite(Integer eggWhite) 
    {
        this.eggWhite = eggWhite;
    }

    public Integer getEggWhite() 
    {
        return eggWhite;
    }

    public void setMilk(Integer milk) 
    {
        this.milk = milk;
    }

    public Integer getMilk() 
    {
        return milk;
    }

    public void setShrimp(Integer shrimp) 
    {
        this.shrimp = shrimp;
    }

    public Integer getShrimp() 
    {
        return shrimp;
    }

    public void setCrab(Integer crab) 
    {
        this.crab = crab;
    }

    public Integer getCrab() 
    {
        return crab;
    }

    public void setSoybean(Integer soybean) 
    {
        this.soybean = soybean;
    }

    public Integer getSoybean() 
    {
        return soybean;
    }

    public void setSesame(Integer sesame) 
    {
        this.sesame = sesame;
    }

    public Integer getSesame() 
    {
        return sesame;
    }

    public void setWheat(Integer wheat) 
    {
        this.wheat = wheat;
    }

    public Integer getWheat() 
    {
        return wheat;
    }

    public void setNuts(Integer nuts) 
    {
        this.nuts = nuts;
    }

    public Integer getNuts() 
    {
        return nuts;
    }

    public void setAllergenOther(String allergenOther) 
    {
        this.allergenOther = allergenOther;
    }

    public String getAllergenOther() 
    {
        return allergenOther;
    }

    public void setSkinPrickTestDate(Date skinPrickTestDate) 
    {
        this.skinPrickTestDate = skinPrickTestDate;
    }

    public Date getSkinPrickTestDate() 
    {
        return skinPrickTestDate;
    }

    public void setPrickHouseDustMite(Integer prickHouseDustMite) 
    {
        this.prickHouseDustMite = prickHouseDustMite;
    }

    public Integer getPrickHouseDustMite() 
    {
        return prickHouseDustMite;
    }

    public void setPrickDustMite(Integer prickDustMite) 
    {
        this.prickDustMite = prickDustMite;
    }

    public Integer getPrickDustMite() 
    {
        return prickDustMite;
    }

    public void setSputumEosinophilTestDate(Date sputumEosinophilTestDate) 
    {
        this.sputumEosinophilTestDate = sputumEosinophilTestDate;
    }

    public Date getSputumEosinophilTestDate() 
    {
        return sputumEosinophilTestDate;
    }

    public void setSputumEosinophilCount(Long sputumEosinophilCount) 
    {
        this.sputumEosinophilCount = sputumEosinophilCount;
    }

    public Long getSputumEosinophilCount() 
    {
        return sputumEosinophilCount;
    }

    public void setTotalIgeRepeatTestDate(Date totalIgeRepeatTestDate) 
    {
        this.totalIgeRepeatTestDate = totalIgeRepeatTestDate;
    }

    public Date getTotalIgeRepeatTestDate() 
    {
        return totalIgeRepeatTestDate;
    }

    public void setTotalIgeRepeatValue(Long totalIgeRepeatValue) 
    {
        this.totalIgeRepeatValue = totalIgeRepeatValue;
    }

    public Long getTotalIgeRepeatValue() 
    {
        return totalIgeRepeatValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("labtestId", getLabtestId())
            .append("followupId", getFollowupId())
            .append("bloodTestDate", getBloodTestDate())
            .append("wbcCount", getWbcCount())
            .append("neutrophilCount", getNeutrophilCount())
            .append("lymphocyteCount", getLymphocyteCount())
            .append("eosinophilCount", getEosinophilCount())
            .append("neutrophilPercent", getNeutrophilPercent())
            .append("lymphocytePercent", getLymphocytePercent())
            .append("eosinophilPercent", getEosinophilPercent())
            .append("hemoglobin", getHemoglobin())
            .append("rbcCount", getRbcCount())
            .append("plateletCount", getPlateletCount())
            .append("cReactiveProtein", getcReactiveProtein())
            .append("allergenComboTestDate", getAllergenComboTestDate())
            .append("totalIge", getTotalIge())
            .append("dustMiteCombo", getDustMiteCombo())
            .append("moldCombo", getMoldCombo())
            .append("petDanderCombo", getPetDanderCombo())
            .append("foodCombo", getFoodCombo())
            .append("nutCombo", getNutCombo())
            .append("singleAllergenTestDate", getSingleAllergenTestDate())
            .append("houseDustMite", getHouseDustMite())
            .append("dustMite", getDustMite())
            .append("pollen", getPollen())
            .append("weed", getWeed())
            .append("aspergillus", getAspergillus())
            .append("alternaria", getAlternaria())
            .append("cockroach", getCockroach())
            .append("catDander", getCatDander())
            .append("dogDander", getDogDander())
            .append("eggWhite", getEggWhite())
            .append("milk", getMilk())
            .append("shrimp", getShrimp())
            .append("crab", getCrab())
            .append("soybean", getSoybean())
            .append("sesame", getSesame())
            .append("wheat", getWheat())
            .append("nuts", getNuts())
            .append("allergenOther", getAllergenOther())
            .append("skinPrickTestDate", getSkinPrickTestDate())
            .append("prickHouseDustMite", getPrickHouseDustMite())
            .append("prickDustMite", getPrickDustMite())
            .append("sputumEosinophilTestDate", getSputumEosinophilTestDate())
            .append("sputumEosinophilCount", getSputumEosinophilCount())
            .append("totalIgeRepeatTestDate", getTotalIgeRepeatTestDate())
            .append("totalIgeRepeatValue", getTotalIgeRepeatValue())
            .toString();
    }
}
