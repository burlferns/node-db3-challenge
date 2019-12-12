const db = require("../data/db-config.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

function find() {
  return db.select("*")
    .from("schemes");
}

function findById(id) {
  return db.select("*")
    .from("schemes")
    .where("id", "=", id)
    .first();
}

function findSteps(id) {
  return db.select("st.id", "sc.scheme_name", "st.step_number", "st.instructions")
    .from("schemes as sc")
    .join("steps as st", "sc.id", "st.scheme_id")
    .where("sc.id", "=", id)
    .orderBy("st.step_number");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme, "id")
    .then(ids=>{
      // console.log("In add function of model & ids is:",ids);
      return findById(ids[0]);
    })
}

function update(changes,id) {
  return db("schemes")
    .update(changes)
    .where('id',id)
    .then(count=>{
      // console.log("In the update function of the model & count is:",count);
      return (count > 0 ? findById(id) : null);
    })
}

function remove(id) {
  return db("schemes")
    .where('id',id)
    .del();
}




