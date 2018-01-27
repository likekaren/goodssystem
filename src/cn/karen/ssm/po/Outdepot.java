package cn.karen.ssm.po;

public class Outdepot {
    private Integer id;

    private Integer goodsid;

    private Integer userid;

    private Integer depotid;

    private Integer outnum;

    private Integer areaid;

    private String zoneid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getDepotid() {
        return depotid;
    }

    public void setDepotid(Integer depotid) {
        this.depotid = depotid;
    }

    public Integer getOutnum() {
        return outnum;
    }

    public void setOutnum(Integer outnum) {
        this.outnum = outnum;
    }

    public Integer getAreaid() {
        return areaid;
    }

    public void setAreaid(Integer areaid) {
        this.areaid = areaid;
    }

    public String getZoneid() {
        return zoneid;
    }

    public void setZoneid(String zoneid) {
        this.zoneid = zoneid == null ? null : zoneid.trim();
    }
}