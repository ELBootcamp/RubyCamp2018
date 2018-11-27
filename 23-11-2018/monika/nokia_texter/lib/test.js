class ToDo{
  constructor(initial_items){
    this.items =initial_items
  }
  add(item){
    this.items.push(item)
  }
  remove(index){
    this.items.splice(index,1)
  }
  edit(index,item){
    this.items[index] = item
  }
}

a = new ToDo(["qqq","eee"])
a.add("aaa")
a.add("bbb")
a.add("ccc")
a.remove(1)
a.edit(0,"ppp")
console.log(a)